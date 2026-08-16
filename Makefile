CC := gcc
CFLAGS := -Wall -Wextra -Werror -O3 -MMD -MP

SRC_DIR := src
BUILD_DIR := build

SRCS_C := $(wildcard $(SRC_DIR)/*.c)
OBJS_C := $(SRCS_C:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)
DEPS_C := $(OBJS_C:.o=.d)

TARGET := $(BUILD_DIR)/LoVe

.PHONY: all run clean

all: $(TARGET)

$(TARGET): $(OBJS_C) | $(BUILD_DIR)
	$(CC) $^ -o $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR):
	mkdir -p $@

run: $(TARGET)
	./$(TARGET)

clean:
	rm -rf $(BUILD_DIR)
