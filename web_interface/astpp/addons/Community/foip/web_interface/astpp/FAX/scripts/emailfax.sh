#!/bin/bash
chmod -Rf 777 $1
#cp -Rf $1 $5
# php $8/tiff_to_pdf.php $1
php /var/www/html/astpp/FAX/scripts/emailfax.php $1 $2 $3 $6 $7 $5 $8
