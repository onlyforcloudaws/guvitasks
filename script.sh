set -e

# to create 10 text files with the word "welcome"
for i in {1..10}
do
  touch $i.txt
  echo "welcome to $i text file" > $i.txt
done

echo "task completed."

echo "Enter var1"
read var1
echo "enter var2"
read var2

if [ $var1 == $var2 ]
then 

	echo "the values are same moving as tar to main"
	git clone https://github.com/onlyforcloudaws/guvitasks.git
	sudo tar -cvf text.tar.gz {1..10}.txt
	mkdir master
	mv text.tar.gz master/
	git add  .
	git commit -m "this is for main"
	git push origin main
else
	echo "the values are different moving as files to develop"
	git clone https://github.com/onlyforcloudaws/guvitasks.git
	mkdir develop
	mv {1..10}.txt develop/
	cd develop/
	git add .
	git commit -m "this is for develop"
	git push origin develop
fi
