import paho.mqtt.client as mqtt_client
import epics
import time
import json
import random

# MQTT配置
MQTT_HOST = "l6622903.ala.cn-hangzhou.emqxsl.cn"
MQTT_PORT = 8883
KEEPALIVE = 600
BASE_TOPIC = "epics/pv/"  # MQTT基础主题
MQTT_USER = "flon"
MQTT_PASSWORD = "123456"
CLIENT_ID = f'publish-{random.randint(0, 100)}'
# EPICS PV列表
PV_LIST = [
        "Sensor1:Dose",  # 替换为实际PV名称
        "Sensor2:Dose"
]

class EpicsMqttBridge:
    def __init__(self, mqtt_host, mqtt_port, mqtt_keepalive, username=None, password=None):
        # 初始化MQTT客户端
        self.client = mqtt_client.Client(
                mqtt_client.CallbackAPIVersion.VERSION2,
                CLIENT_ID)

        # 设置用户名和密码
        if username and password:
            self.client.username_pw_set(username, password)
            print("MQTT authentication enabled")
        else:
            print("Warning:No authentication credentials provided")

        
        self.client.tls_set()
        self.client.on_connect = self.on_connect
        self.client.on_disconnect = self.on_disconnect
        self.client.connect(mqtt_host, mqtt_port, mqtt_keepalive)
        
        # 启动MQTT循环
        self.client.loop_start()

        # 创建EPICS PV监控
        self.pvs = {}
        for pv_name in PV_LIST:
            # 为每个PV创建监控并设置回调
            self.pvs[pv_name] = epics.PV(
                pv_name,
                callback=self.epics_callback,
                form='time'  # 获取时间戳和值
            )
            print(f"Monitoring EPICS PV: {pv_name}")

        
        # 保持主线程运行
        try:
            while True:
                time.sleep(1)
        except KeyboardInterrupt:
            self.client.loop_stop()
            print("Published stopped")

    # EPICS PV变化回调
    def epics_callback(self, pvname, value, char_value, timestamp, **kw):
        """当PV值更新时，通过MQTT发布数据"""
        topic = f"{BASE_TOPIC}{pvname}"
        payload = json.dumps({
            "value": value,
            "timestamp": timestamp,
            "status": "OK" if kw['severity'] == 0 else "ALARM"
        })
        self.client.publish(topic, payload)
        print(f"Published: [{topic}] -> {payload}")

    # MQTT回调函数
    def on_connect(self, client, userdata, flags, reason_code, properties):
        print(f"MQTT Connected with code: {reason_code}")

    
    # MQTT断开连接回调
    def on_disconnect(self, client, userdata, disconnect_flags, reason_code, properties):
        if rc != 0:
            print(f"Unexpected diconnection(code: {reason_code}). Reconnecting...")
            self.client.reconnect()
if __name__ == '__main__':
    bridge = EpicsMqttBridge(
            mqtt_host = MQTT_HOST, 
            mqtt_port = MQTT_PORT, 
            mqtt_keepalive = KEEPALIVE,
            username = MQTT_USER,
            password = MQTT_PASSWORD
            )
