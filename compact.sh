#!bin/bash

Main()
{
	read -p "拖入路径" DIR
	local files=`find $DIR -name '*.json'`
	local oldSize=0
	local newSize=0
	for file in $files
	do
		local fileInfo=`wc -c $file`
		local array=(${fileInfo})   ##字符串转空格分割的数组
		local fileSize=${array[0]}	##取数组第一个单词
		((oldSize+=$fileSize))
		
		echo $file
		# jq 'try error("\($__loc__)") catch .' $file
		local r=`jq -c . $file` 
		echo $r > $file
		
		fileInfo=`wc -c $file`
		array=(${fileInfo})   ##字符串转空格分割的数组
		fileSize=${array[0]}	##取数组第一个单词
		((newSize+=$fileSize))
	done

	oldSize=$(echo "scale=3; $oldSize/1024/1024 " | bc )
	newSize=$(echo "scale=3; $newSize/1024/1024 " | bc )
	local diff=$(echo "scale=3; $oldSize-$newSize " | bc )
	echo 压缩前: $oldSize M
	echo 压缩后: $newSize M
	echo 节约: $diff M
}
Main