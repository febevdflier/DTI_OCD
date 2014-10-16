cd /work/imagingF/DTI_OCD/RAW_MRI_DATA

for id in 314 ; do

	echo ============= $id =============
	dti_dir=(`ls -d /work/imagingF/DTI_OCD/RAW_MRI_DATA/$id/2014*/Series_*_AP`)
#	if [[ ${#dti_dir[@]} != 1 ]]; then
#		echo "OH NO - not only one AP dti_dir"
#	else
		cd ${dti_dir}
		pwd
#		ls
		fslmaths DATA_0011.nii dti.nii.gz
#		ls
#	fi
cp DATA_0011.bvecs /work/imagingF/DTI_OCD/SUB_DATA/$id/t1/DTI_AP/bvecs_orig
cp DATA_0011.bvals /work/imagingF/DTI_OCD/SUB_DATA/$id/t1/DTI_AP/bvals
cp dti.nii.gz /work/imagingF/DTI_OCD/SUB_DATA/$id/t1/DTI_AP/
cd .. 
cd Series_*_PA
pwd
fslmaths DATA_0019.nii dti.nii.gz
echo "1 is this the problem?"
cp DATA_0019.bvecs /work/imagingF/DTI_OCD/SUB_DATA/$id/t1/DTI_PA/bvecs_orig
echo "2 is this the problem?"
cp DATA_0019.bvals /work/imagingF/DTI_OCD/SUB_DATA/$id/t1/DTI_PA/bvals
echo "3 is this the problem?"
cp dti.nii.gz /work/imagingF/DTI_OCD/SUB_DATA/$id/t1/DTI_PA/
echo "4 is this the problem? ${id}"
cd ../../../..
cd SUB_DATA/$id/t1/DTI_RL
echo "" > no_data
cd ../..
cd t2
rm DTI_AP
rm DTI_PA
rm DTI_RL
rm DTI_MPRAGE
echo "" > no_scan

done
