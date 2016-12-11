/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000001090125240_2881073799_init();
    work_m_00000000003790603676_0402448039_init();
    work_m_00000000000717806558_2478337979_init();
    work_m_00000000003936961722_3635067292_init();
    work_m_00000000002430770045_0956042797_init();
    work_m_00000000000450352787_2382713414_init();
    work_m_00000000003028461486_3996337969_init();
    work_m_00000000003163544707_2120256038_init();
    work_m_00000000001195937212_0193139117_init();
    work_m_00000000002851646775_0632812995_init();
    work_m_00000000000801448658_2279152435_init();
    work_m_00000000002654773265_1675265958_init();
    work_m_00000000000804027823_3069169239_init();
    work_m_00000000003328052106_2415336395_init();
    work_m_00000000002913837821_1292031434_init();
    work_m_00000000003912466781_0891450549_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003912466781_0891450549");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
