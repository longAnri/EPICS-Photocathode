import paho.mqtt.client as mqtt

# MQTT 服务器配置
broker = 'l6622903.ala.cn-hangzhou.emqxsl.cn'
port = 8084
topic = 'test/topic'  # 你可以随便写个 topic 名
message = 'Hello, MQTT! 我是客户端'

# 创建客户端对象
client = mqtt.Client()

# 连接到 MQTT 服务器
client.connect(broker, port, keepalive=60)

# 发布一条消息
result = client.publish(topic, message)

# 检查发送结果
status = result[0]
if status == 0:
    print(f"✅ 成功发送消息到 topic `{topic}`：{message}")
else:
    print(f"❌ 发送失败，返回码：{status}")

# 断开连接
client.disconnect()

