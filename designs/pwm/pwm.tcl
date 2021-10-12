set DESIGN_DIR /home/qlblue/anthony/evk_validation/designs/pwm

compile_design $DESIGN_DIR/rtl/ONION_PWM.v $DESIGN_DIR/rtl/top.v --part RSMX1TFF512 --pkg PU64 --top top --working_dir $DESIGN_DIR/output --load_qdc $DESIGN_DIR/pwm.qdc
run_till optimizer 
run_till placer 
run_till router 
save_project
exit  
