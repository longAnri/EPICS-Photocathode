# Makefile for ttycat + custom baud rate support

# 可执行文件名
TARGET = ttycat

# 编译器和常用选项
CC = gcc
CFLAGS = -Wall -O2
# 如果需要调试，可以临时改成： CFLAGS = -Wall -g -O0

# 源文件列表
SOURCES = ttycat.c set_tty_speed_via_termios2.c

# 目标：默认构建可执行文件
all: $(TARGET)

# 链接规则
$(TARGET): $(SOURCES:.c=.o)
	$(CC) $(CFLAGS) $^ -o $@

# 编译每个 .c → .o 的通用规则
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# 清理生成的文件
clean:
	rm -f $(TARGET) *.o

# 伪目标（不是真实文件）
.PHONY: all clean

# 可选：快速测试运行（需要 sudo）
run: $(TARGET)
	sudo ./$(TARGET) /dev/ttyUSB0 921600

# 可选：调试模式编译 + 运行
debug: CFLAGS = -Wall -g -O0
debug: clean all
