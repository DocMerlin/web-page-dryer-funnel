if [ $DEV = true ]; then echo "DEVELOPMENT MODE";fi
ln -s $HOME/wkhtmltopdf-0.9.9-OS-X.i368 $VIRTUAL_ENV/usr/local/bin/WKHTMLTOPD
cd ChicagoBoss
make
cd ../web_page_dryer_funnel
if [ $DEV = true ]; then ./init-dev.sh;else 
./init.sh start-standalone;

while true; do
	sleep 10
done;

fi
