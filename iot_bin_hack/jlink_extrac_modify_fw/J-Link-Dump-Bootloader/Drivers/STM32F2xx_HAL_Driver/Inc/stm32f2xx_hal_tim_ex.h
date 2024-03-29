/**
  ******************************************************************************
  * @file    stm32f2xx_hal_tim_ex.h
  * @author  MCD Application Team
  * @brief   Header file of TIM HAL Extension module.
  ******************************************************************************
  */ 

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __STM32F2xx_HAL_TIM_EX_H
#define __STM32F2xx_HAL_TIM_EX_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f2xx_hal_def.h"

/** @addtogroup STM32F2xx_HAL_Driver
  * @{
  */

/** @addtogroup TIMEx
  * @{
  */ 

/* Exported types ------------------------------------------------------------*/ 
/** @defgroup TIMEx_Exported_Types TIM Exported Types
  * @{
  */
  
/** 
  * @brief  TIM Hall sensor Configuration Structure definition  
  */

typedef struct
{
                                  
  uint32_t IC1Polarity;            /*!< Specifies the active edge of the input signal.
                                        This parameter can be a value of @ref TIM_Input_Capture_Polarity */
                                                                   
  uint32_t IC1Prescaler;        /*!< Specifies the Input Capture Prescaler.
                                     This parameter can be a value of @ref TIM_Input_Capture_Prescaler */
                                  
  uint32_t IC1Filter;           /*!< Specifies the input capture filter.
                                     This parameter can be a number between Min_Data = 0x0 and Max_Data = 0xF */  
  uint32_t Commutation_Delay;  /*!< Specifies the pulse value to be loaded into the Capture Compare Register. 
                                    This parameter can be a number between Min_Data = 0x0000 and Max_Data = 0xFFFF */                              
} TIM_HallSensor_InitTypeDef;

/** 
  * @brief  TIM Master configuration Structure definition  
  */ 
typedef struct {
  uint32_t  MasterOutputTrigger;   /*!< Trigger output (TRGO) selection. 
                                      This parameter can be a value of @ref TIM_Master_Mode_Selection */ 
  uint32_t  MasterSlaveMode;       /*!< Master/slave mode selection. 
                                      This parameter can be a value of @ref TIM_Master_Slave_Mode */
}TIM_MasterConfigTypeDef;

/** 
  * @brief  TIM Break and Dead time configuration Structure definition  
  */ 
typedef struct
{
  uint32_t OffStateRunMode;            /*!< TIM off state in run mode.
                                         This parameter can be a value of @ref TIM_OSSR_Off_State_Selection_for_Run_mode_state */
  uint32_t OffStateIDLEMode;          /*!< TIM off state in IDLE mode.
                                         This parameter can be a value of @ref TIM_OSSI_Off_State_Selection_for_Idle_mode_state */
  uint32_t LockLevel;                     /*!< TIM Lock level.
                                         This parameter can be a value of @ref TIM_Lock_level */                             
  uint32_t DeadTime;                     /*!< TIM dead Time. 
                                         This parameter can be a number between Min_Data = 0x00 and Max_Data = 0xFF */
  uint32_t BreakState;                   /*!< TIM Break State. 
                                         This parameter can be a value of @ref TIM_Break_Input_enable_disable */
  uint32_t BreakPolarity;                 /*!< TIM Break input polarity. 
                                         This parameter can be a value of @ref TIM_Break_Polarity */
  uint32_t AutomaticOutput;               /*!< TIM Automatic Output Enable state. 
                                         This parameter can be a value of @ref TIM_AOE_Bit_Set_Reset */           
}TIM_BreakDeadTimeConfigTypeDef;
/**
  * @}
  */
  
/* Exported constants --------------------------------------------------------*/
/** @defgroup TIMEx_Exported_Constants  TIM Exported Constants
  * @{
  */
  
/** @defgroup TIMEx_Remap  TIM Remap
  * @{
  */
#define TIM_TIM2_TIM8_TRGO                     0x00000000U
#define TIM_TIM2_ETH_PTP                       0x00000400U
#define TIM_TIM2_USBFS_SOF                     0x00000800U
#define TIM_TIM2_USBHS_SOF                     0x00000C00U
#define TIM_TIM5_GPIO                          0x00000000U
#define TIM_TIM5_LSI                           0x00000040U
#define TIM_TIM5_LSE                           0x00000080U
#define TIM_TIM5_RTC                           0x000000C0U
#define TIM_TIM11_GPIO                         0x00000000U
#define TIM_TIM11_HSE                          0x00000002U

/**
  * @}
  */ 

/**
  * @}
  */ 
  
/* Exported macro ------------------------------------------------------------*/
/* Exported functions --------------------------------------------------------*/
/** @addtogroup TIMEx_Exported_Functions
  * @{
  */

/** @addtogroup TIMEx_Exported_Functions_Group1
  * @{
  */
/*  Timer Hall Sensor functions  **********************************************/
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Init(TIM_HandleTypeDef* htim, TIM_HallSensor_InitTypeDef* sConfig);
HAL_StatusTypeDef HAL_TIMEx_HallSensor_DeInit(TIM_HandleTypeDef* htim);

void HAL_TIMEx_HallSensor_MspInit(TIM_HandleTypeDef* htim);
void HAL_TIMEx_HallSensor_MspDeInit(TIM_HandleTypeDef* htim);

 /* Blocking mode: Polling */
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Start(TIM_HandleTypeDef* htim);
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Stop(TIM_HandleTypeDef* htim);
/* Non-Blocking mode: Interrupt */
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Start_IT(TIM_HandleTypeDef* htim);
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Stop_IT(TIM_HandleTypeDef* htim);
/* Non-Blocking mode: DMA */
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Start_DMA(TIM_HandleTypeDef* htim, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Stop_DMA(TIM_HandleTypeDef* htim);
/**
  * @}
  */

/** @addtogroup TIMEx_Exported_Functions_Group2
  * @{
  */
/*  Timer Complementary Output Compare functions  *****************************/
/* Blocking mode: Polling */
HAL_StatusTypeDef HAL_TIMEx_OCN_Start(TIM_HandleTypeDef* htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIMEx_OCN_Stop(TIM_HandleTypeDef* htim, uint32_t Channel);

/* Non-Blocking mode: Interrupt */
HAL_StatusTypeDef HAL_TIMEx_OCN_Start_IT(TIM_HandleTypeDef* htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIMEx_OCN_Stop_IT(TIM_HandleTypeDef* htim, uint32_t Channel);

/* Non-Blocking mode: DMA */
HAL_StatusTypeDef HAL_TIMEx_OCN_Start_DMA(TIM_HandleTypeDef* htim, uint32_t Channel, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIMEx_OCN_Stop_DMA(TIM_HandleTypeDef* htim, uint32_t Channel);
/**
  * @}
  */

/** @addtogroup TIMEx_Exported_Functions_Group3
  * @{
  */
/*  Timer Complementary PWM functions  ****************************************/
/* Blocking mode: Polling */
HAL_StatusTypeDef HAL_TIMEx_PWMN_Start(TIM_HandleTypeDef* htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIMEx_PWMN_Stop(TIM_HandleTypeDef* htim, uint32_t Channel);

/* Non-Blocking mode: Interrupt */
HAL_StatusTypeDef HAL_TIMEx_PWMN_Start_IT(TIM_HandleTypeDef* htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIMEx_PWMN_Stop_IT(TIM_HandleTypeDef* htim, uint32_t Channel);
/* Non-Blocking mode: DMA */
HAL_StatusTypeDef HAL_TIMEx_PWMN_Start_DMA(TIM_HandleTypeDef* htim, uint32_t Channel, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIMEx_PWMN_Stop_DMA(TIM_HandleTypeDef* htim, uint32_t Channel);
/**
  * @}
  */

/** @addtogroup TIMEx_Exported_Functions_Group4
  * @{
  */
/*  Timer Complementary One Pulse functions  **********************************/
/* Blocking mode: Polling */
HAL_StatusTypeDef HAL_TIMEx_OnePulseN_Start(TIM_HandleTypeDef* htim, uint32_t OutputChannel);
HAL_StatusTypeDef HAL_TIMEx_OnePulseN_Stop(TIM_HandleTypeDef* htim, uint32_t OutputChannel);

/* Non-Blocking mode: Interrupt */
HAL_StatusTypeDef HAL_TIMEx_OnePulseN_Start_IT(TIM_HandleTypeDef* htim, uint32_t OutputChannel);
HAL_StatusTypeDef HAL_TIMEx_OnePulseN_Stop_IT(TIM_HandleTypeDef* htim, uint32_t OutputChannel);
/**
  * @}
  */

/** @addtogroup TIMEx_Exported_Functions_Group5
  * @{
  */
/* Extension Control functions  ************************************************/
HAL_StatusTypeDef HAL_TIMEx_ConfigCommutationEvent(TIM_HandleTypeDef* htim, uint32_t  InputTrigger, uint32_t  CommutationSource);
HAL_StatusTypeDef HAL_TIMEx_ConfigCommutationEvent_IT(TIM_HandleTypeDef* htim, uint32_t  InputTrigger, uint32_t  CommutationSource);
HAL_StatusTypeDef HAL_TIMEx_ConfigCommutationEvent_DMA(TIM_HandleTypeDef* htim, uint32_t  InputTrigger, uint32_t  CommutationSource);
HAL_StatusTypeDef HAL_TIMEx_MasterConfigSynchronization(TIM_HandleTypeDef* htim, TIM_MasterConfigTypeDef * sMasterConfig);
HAL_StatusTypeDef HAL_TIMEx_ConfigBreakDeadTime(TIM_HandleTypeDef* htim, TIM_BreakDeadTimeConfigTypeDef *sBreakDeadTimeConfig);
HAL_StatusTypeDef HAL_TIMEx_RemapConfig(TIM_HandleTypeDef* htim, uint32_t Remap);
/**
  * @}
  */

/** @addtogroup TIMEx_Exported_Functions_Group6
  * @{
  */ 
/* Extension Callback *********************************************************/
void HAL_TIMEx_CommutationCallback(TIM_HandleTypeDef* htim);
void HAL_TIMEx_BreakCallback(TIM_HandleTypeDef* htim);
void TIMEx_DMACommutationCplt(DMA_HandleTypeDef *hdma);
/**
  * @}
  */

/** @addtogroup TIMEx_Exported_Functions_Group7
  * @{
  */
/* Extension Peripheral State functions  **************************************/
HAL_TIM_StateTypeDef HAL_TIMEx_HallSensor_GetState(TIM_HandleTypeDef* htim);
/**
  * @}
  */ 

/**
  * @}
  */ 

/* Private types -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private constants ---------------------------------------------------------*/
/* Private macros ------------------------------------------------------------*/
/** @defgroup TIMEx_Private_Macros TIM Private Macros
  * @{
  */
#define IS_TIM_REMAP(TIM_REMAP)   (((TIM_REMAP) == TIM_TIM2_TIM8_TRGO)||\
                                  ((TIM_REMAP) == TIM_TIM2_ETH_PTP)||\
                                  ((TIM_REMAP) == TIM_TIM2_USBFS_SOF)||\
                                  ((TIM_REMAP) == TIM_TIM2_USBHS_SOF)||\
                                  ((TIM_REMAP) == TIM_TIM5_GPIO)||\
                                  ((TIM_REMAP) == TIM_TIM5_LSI)||\
                                  ((TIM_REMAP) == TIM_TIM5_LSE)||\
                                  ((TIM_REMAP) == TIM_TIM5_RTC)||\
                                  ((TIM_REMAP) == TIM_TIM11_GPIO)||\
                                  ((TIM_REMAP) == TIM_TIM11_HSE))

#define IS_TIM_DEADTIME(DEADTIME)      ((DEADTIME) <= 0xFFU) 

/**
  * @brief  Sets the TIM Output compare preload.
  * @param  __HANDLE__ TIM handle.
  * @param  __CHANNEL__ TIM Channels to be configured.
  *          This parameter can be one of the following values:
  *            @arg TIM_CHANNEL_1: TIM Channel 1 selected
  *            @arg TIM_CHANNEL_2: TIM Channel 2 selected
  *            @arg TIM_CHANNEL_3: TIM Channel 3 selected
  *            @arg TIM_CHANNEL_4: TIM Channel 4 selected
  * @retval None
  */
#define __HAL_TIM_ENABLE_OCxPRELOAD(__HANDLE__, __CHANNEL__)    \
        (((__CHANNEL__) == TIM_CHANNEL_1) ? ((__HANDLE__)->Instance->CCMR1 |= TIM_CCMR1_OC1PE) :\
         ((__CHANNEL__) == TIM_CHANNEL_2) ? ((__HANDLE__)->Instance->CCMR1 |= TIM_CCMR1_OC2PE) :\
         ((__CHANNEL__) == TIM_CHANNEL_3) ? ((__HANDLE__)->Instance->CCMR2 |= TIM_CCMR2_OC3PE) :\
         ((__HANDLE__)->Instance->CCMR2 |= TIM_CCMR2_OC4PE))

/**
  * @brief  Resets the TIM Output compare preload.
  * @param  __HANDLE__ TIM handle.
  * @param  __CHANNEL__ TIM Channels to be configured.
  *          This parameter can be one of the following values:
  *            @arg TIM_CHANNEL_1: TIM Channel 1 selected
  *            @arg TIM_CHANNEL_2: TIM Channel 2 selected
  *            @arg TIM_CHANNEL_3: TIM Channel 3 selected
  *            @arg TIM_CHANNEL_4: TIM Channel 4 selected
  * @retval None
  */
#define __HAL_TIM_DISABLE_OCxPRELOAD(__HANDLE__, __CHANNEL__)    \
        (((__CHANNEL__) == TIM_CHANNEL_1) ? ((__HANDLE__)->Instance->CCMR1 &= (uint16_t)~TIM_CCMR1_OC1PE) :\
         ((__CHANNEL__) == TIM_CHANNEL_2) ? ((__HANDLE__)->Instance->CCMR1 &= (uint16_t)~TIM_CCMR1_OC2PE) :\
         ((__CHANNEL__) == TIM_CHANNEL_3) ? ((__HANDLE__)->Instance->CCMR2 &= (uint16_t)~TIM_CCMR2_OC3PE) :\
         ((__HANDLE__)->Instance->CCMR2 &= (uint16_t)~TIM_CCMR2_OC4PE))

/**
  * @}
  */  
  
/* Private functions ---------------------------------------------------------*/
/** @defgroup TIMEx_Private_Functions TIM Private Functions
  * @{
  */
  
/**
  * @}
  */

/**
  * @}
  */ 

/**
  * @}
  */
    
#ifdef __cplusplus
}
#endif

#endif /* __STM32F2xx_HAL_TIM_EX_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
