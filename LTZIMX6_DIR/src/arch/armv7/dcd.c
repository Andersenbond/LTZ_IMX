/*
 * Copyright (c) 2010-2012, Freescale Semiconductor, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * o Redistributions of source code must retain the above copyright notice, this list
 *   of conditions and the following disclaimer.
 *
 * o Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 *
 * o Neither the name of Freescale Semiconductor, Inc. nor the names of its
 *   contributors may be used to endorse or promote products derived from this
 *   software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <hab_defines.h>
#include <soc_memory_map.h>
#define REGS_CCM_BASE (0x020c4000) //!< Base address for CCM.

//! @brief dcd data, list of (register, value) pairs to initialize ddr
uint8_t input_dcd[] __attribute__ ((section(".dcd_data"))) = {
/*
 * The DDR init commands below are based on MX6_series_boards/SabreSD/RevC_and_RevB/MX6DQ/MX6Q_SabreSD_DDR3_register_programming_aid_v1.6.inc
 * This file can be found at ddr-script-rel git with commit dfde48ed72f0d43bff72bd372df54d5043b855c8
 */

        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x774), EXPAND_UINT32(0x000C0000),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x754), EXPAND_UINT32(0x00000000),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x4ac), EXPAND_UINT32(0x00000030),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x4b0), EXPAND_UINT32(0x00000030),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x464), EXPAND_UINT32(0x00000030),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x490), EXPAND_UINT32(0x00000030),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x74c), EXPAND_UINT32(0x00000030),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x494), EXPAND_UINT32(0x00000030),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x4a0), EXPAND_UINT32(0x00000000),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x4b4), EXPAND_UINT32(0x00000030),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x4b8), EXPAND_UINT32(0x00000030),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x76c), EXPAND_UINT32(0x00000030),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x750), EXPAND_UINT32(0x00020000),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x4bc), EXPAND_UINT32(0x00000030),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x4c0), EXPAND_UINT32(0x00000030),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x4c4), EXPAND_UINT32(0x00000030),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x4c8), EXPAND_UINT32(0x00000030),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x760), EXPAND_UINT32(0x00020000),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x764), EXPAND_UINT32(0x00000030),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x770), EXPAND_UINT32(0x00000030),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x778), EXPAND_UINT32(0x00000030),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x77c), EXPAND_UINT32(0x00000030),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x470), EXPAND_UINT32(0x00000030),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x474), EXPAND_UINT32(0x00000030),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x478), EXPAND_UINT32(0x00000030),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x47c), EXPAND_UINT32(0x00000030),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x800), EXPAND_UINT32(0xa1390003),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x80c), EXPAND_UINT32(0x001F001F),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x810), EXPAND_UINT32(0x001F001F),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x83c), EXPAND_UINT32(0x42190219),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x840), EXPAND_UINT32(0x017B0177),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x848), EXPAND_UINT32(0x4B4D4E4D),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x850), EXPAND_UINT32(0x3F3E2D36),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x81c), EXPAND_UINT32(0x33333333),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x820), EXPAND_UINT32(0x33333333),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x824), EXPAND_UINT32(0x33333333),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x828), EXPAND_UINT32(0x33333333),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x8b8), EXPAND_UINT32(0x00000800),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x004), EXPAND_UINT32(0x0002002D),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x008), EXPAND_UINT32(0x00333030),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x00c), EXPAND_UINT32(0x3F435313),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x010), EXPAND_UINT32(0xB66E8B63),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x014), EXPAND_UINT32(0x01FF00DB),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x018), EXPAND_UINT32(0x00001740),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x01c), EXPAND_UINT32(0x00008000),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x02c), EXPAND_UINT32(0x000026d2),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x030), EXPAND_UINT32(0x00431023),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x040), EXPAND_UINT32(0x00000017),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x000), EXPAND_UINT32(0x83190000),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x01c), EXPAND_UINT32(0x04008032),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x01c), EXPAND_UINT32(0x00008033),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x01c), EXPAND_UINT32(0x00048031),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x01c), EXPAND_UINT32(0x05208030),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x01c), EXPAND_UINT32(0x04008040),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x020), EXPAND_UINT32(0x00005800),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x818), EXPAND_UINT32(0x00011117),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x004), EXPAND_UINT32(0x0002556D),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x404), EXPAND_UINT32(0x00011006),
        EXPAND_UINT32(MMDC_P0_BASE_ADDR + 0x01c), EXPAND_UINT32(0x00000000),

        /* set the default clock gate to save power */
        EXPAND_UINT32(REGS_CCM_BASE + 0x068), EXPAND_UINT32(0x00C03F3F),
        EXPAND_UINT32(REGS_CCM_BASE + 0x06c), EXPAND_UINT32(0x0030FC03),
        EXPAND_UINT32(REGS_CCM_BASE + 0x070), EXPAND_UINT32(0x0FFFC000),
        EXPAND_UINT32(REGS_CCM_BASE + 0x074), EXPAND_UINT32(0x3FF00000),
        EXPAND_UINT32(REGS_CCM_BASE + 0x078), EXPAND_UINT32(0x00FFF300),
        EXPAND_UINT32(REGS_CCM_BASE + 0x07c), EXPAND_UINT32(0x0F0000C3),
        EXPAND_UINT32(REGS_CCM_BASE + 0x080), EXPAND_UINT32(0x000003FF),

        /* enable AXI cache for VDOA/VPU/IPU */
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x010), EXPAND_UINT32(0xF00000CF),
        /*  set IPU AXI-id0 Qos=0xf(bypass) AXI-id1 Qos=0x7 */
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x018), EXPAND_UINT32(0x007F007F),
        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x01c), EXPAND_UINT32(0x007F007F),

        EXPAND_UINT32(IOMUXC_BASE_ADDR + 0x024), EXPAND_UINT32(0x00000003),

};

//! @brief HAB command write data header, with tag,
//!        size of dcd data with hdr,
//!        parameter field (size of register value and flag)
uint8_t input_dcd_wrt_cmd[] __attribute__ ((section(".dcd_wrt_cmd"))) = {
    HAB_CMD_WRT_DAT, EXPAND_UINT16(sizeof(input_dcd) + HDR_BYTES), WRT_DAT_PAR(0, HAB_DATA_WIDTH_WORD)  //!< flag 0, width 4
};

//! @brief HAB dcd header with dcd tag, size of entire dcd and version.
uint8_t input_dcd_hdr[] __attribute__ ((section(".dcd_hdr"))) = {
    HAB_TAG_DCD,
        EXPAND_UINT16(sizeof(input_dcd) + sizeof(input_dcd_wrt_cmd) + HDR_BYTES), HAB_VER(4, 0)
};