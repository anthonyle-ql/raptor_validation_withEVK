#!/bin/bash

# record start time
date

# setup raptor tool environment
# make update for proper tool installation location
# make update for license file location
export PATH=~/raptor_64/bin:$PATH
export quicklogic_LICENSE=~/anthony/raptor_licenses/raptor-40000.lic

# setup raptor evk validation environment
export COMBINER_LOC=$PWD/fpgabincombiner
export DESIGN_LOC=$PWD/designs/
export DESIGN_NAME=pwm

# remove exisitng output directory
rm -r $DESIGN_LOC/$DESIGN_NAME/output
mkdir $DESIGN_LOC/$DESIGN_NAME/output

# execute TCL script
raptor --tcl $DESIGN_LOC/$DESIGN_NAME/$DESIGN_NAME.tcl
mv *.log $DESIGN_LOC/$DESIGN_NAME/output/.

# creating iomux.bin based on design IO placement
cd $DESIGN_LOC/$DESIGN_NAME
python3 $COMBINER_LOC/iomuxgen.py --iomuxcsv=$DESIGN_LOC/$DESIGN_NAME/${DESIGN_NAME}_io.csv --iomuxbin=$DESIGN_LOC/$DESIGN_NAME/output/${DESIGN_NAME}_iomux.bin

# creating EVK bin file
python3 $COMBINER_LOC/fpgabincombiner.py --bitstream=$DESIGN_LOC/$DESIGN_NAME/output/config_bit_gen/RSMX1TFF512_top.bin --iomuxbin=$DESIGN_LOC/$DESIGN_NAME/output/${DESIGN_NAME}_iomux.bin --fpgabin=$DESIGN_LOC/$DESIGN_NAME/output/${DESIGN_NAME}_evk.bin


# record end time
date
















