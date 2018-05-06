#!/bin/bash
#SBATCH -N 1
#SBATCH --ntasks-per-node 1
#SBATCH -p RM-small
#SBATCH -t 6:00:00
#SBATCH --mail-type=ALL

DATASET_NAME="272-c03"
DATASET_TAR_NAME="2-$DATASET_NAME.tar.gz"

DATASET_ROOTDIR="/pylon5/bi5fpep/yiz141/csv_subset"
DATASET_EXTRACT_PATH="$DATASET_ROOTDIR/Subset-upload-$DATASET_NAME"

echo "Unzipping dataset# $DATASET_NAME..."

date

mkdir -p $DATASET_EXTRACT_PATH
tar xvf $DATASET_ROOTDIR/$DATASET_TAR_NAME --overwrite -C $DATASET_EXTRACT_PATH
chmod 0440 "$DATASET_EXTRACT_PATH/*"

date
echo "Unzipping for # $DATASET_NAME successfully finished."
