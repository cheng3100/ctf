# ------------------------------------------------
# Generic Makefile (based on gcc)
#
# ChangeLog :
#   2020-11-18 - first version
# ------------------------------------------------

######################################
# target
######################################
TARGET = target
TARGET_ELF = $(BUILD_DIR)/$(TARGET).elf


######################################
# building variables
######################################
# optimization
OPT = -Og

V ?= 1

ifeq ($(V), 1)
Q =
else
Q = @
endif

#######################################
# paths
#######################################
# Build path
BUILD_DIR = build

######################################
# source
######################################
# C sources
C_SOURCES =  target.c

#######################################
# binaries
#######################################
PREFIX =
# The gcc compiler bin path can be either defined in make command via GCC_PATH variable (> make GCC_PATH=xxx)
# either it can be added to the PATH environment variable.
ifdef GCC_PATH
CC = $(GCC_PATH)/$(PREFIX)gcc
AS = $(GCC_PATH)/$(PREFIX)gcc -x assembler-with-cpp
CP = $(GCC_PATH)/$(PREFIX)objcopy
DP = $(GCC_PATH)/$(PREFIX)objdump
SZ = $(GCC_PATH)/$(PREFIX)size
else
CC = $(PREFIX)gcc
AS = $(PREFIX)gcc -x assembler-with-cpp
CP = $(PREFIX)objcopy
DP = $(PREFIX)objdump
SZ = $(PREFIX)size
endif
HEX = $(CP) -O ihex
BIN = $(CP) -O binary -S

#######################################
# CFLAGS
#######################################
# cpu
CPU = -mcpu=cortex-m3

# fpu
# NONE for Cortex-M0/M0+/M3

# float-abi

# compile gcc flags
# ASFLAGS = $(AS_DEFS) $(AS_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections
# pie no NX
CFLAGS =  \
-no-pie \
-z execstack \
-fno-stack-protector \
-fomit-frame-pointer

# default action: build all
all: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin  $(BUILD_DIR)/$(TARGET).asm


#######################################
# build the application
#######################################
# list of objects
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))
# list of ASM program objects
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))

$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR)
	$(Q) $(CC) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/%.o: %.s Makefile | $(BUILD_DIR)
	$(Q) $(AS) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS) Makefile
	$(CC) $(OBJECTS) $(CFLAGS) -o $@
	$(SZ) $@

$(BUILD_DIR)/%.hex: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(HEX) $< $@

$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(BIN) $< $@

$(BUILD_DIR)/%.asm: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(DP) -S $< > $@

shell: shellcode.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) $< -o $(BUILD_DIR)/shell

shelltest: shellcode.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) $< -o $(BUILD_DIR)/shell
	./$(BUILD_DIR)/shell

shellbin: test.py | $(BUILD_DIR)
	./test.py > $(BUILD_DIR)/test.sc
	xxd $(BUILD_DIR)/test.sc

try: $(BUILD_DIR)/$(TARGET).elf $(shellbin)| $(BUILD_DIR)
	./$(BUILD_DIR)/$(TARGET).elf < $(BUILD_DIR)/test.sc

$(BUILD_DIR):
	mkdir $@

# gdb: $(TARGET_ELF)
#     arm-none-eabi-gdb --eval-command="target remote localhost:3333"  --ex="mon reset" --ex="load"  --se=$(TARGET_ELF)
#
# gdb-client:
#     arm-none-eabi-gdb --eval-command="target remote localhost:3333"
#
# gdbserver:
#     pyocd gdbserver -t stm32f103rc
#
# flash: $(TARGET_ELF)
#     pyocd flash $(TARGET_ELF) -t stm32f103rc
#

#######################################
# clean up
#######################################
clean:
	-rm -fR $(BUILD_DIR)

#######################################
# dependencies
#######################################
-include $(wildcard $(BUILD_DIR)/*.d)

# *** EOF ***
