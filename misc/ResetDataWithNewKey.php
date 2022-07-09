<?php
$astpp_config = parse_ini_file ( "/var/lib/astpp/astpp-config.conf" );
$con=mysqli_connect( $astpp_config ['dbhost'],$astpp_config ['dbuser'],$astpp_config ['dbpass'],$astpp_config ['dbname']);
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }
$private_key="8YSDaBtDHAB3EQkxPAyTz2I5DttzA9uR";
$new_privateKey = $astpp_config["PRIVATE_KEY"];

$query="select id,password from accounts";
$result =mysqli_query($con,$query);
while($row=mysqli_fetch_assoc($result)){
        $plain_password=password_decrypt($row['password']);
        $new_password=password_encrypt($plain_password);
        $query="update accounts set password='$new_password' where id=".$row['id'];
        $update_result =mysqli_query($con,$query);
}
function password_decrypt($value){
        global $private_key;
        $crypttext = decode_params($value);
        $ivSize = openssl_cipher_iv_length('BF-ECB');
        $iv = substr($crypttext, 0, $ivSize);
        $data = openssl_decrypt(substr($crypttext, $ivSize), 'BF-ECB', $private_key, OPENSSL_RAW_DATA, $iv);
        return trim($data);
}

function decode_params($string) {
        $data = str_replace ( array (
                        '-',
                        '$'
        ), array (
                        '+',
                        '/'
        ), $string );
        $mod4 = strlen ( $data ) % 4;
        if ($mod4) {
                $data .= substr ( '====', $mod4 );
        }
        return base64_decode ( $data );
}


function encode_params($string) {
        $data = base64_encode ( $string );
        $data = str_replace ( array (
                        '+',
                        '/',
                        '='
        ), array (
                        '-',
                        '$',
                        ''
        ), $data );
        return $data;
}

function password_encrypt($value) {
        global $new_privateKey;
        $ivSize = openssl_cipher_iv_length('BF-ECB');
        $iv = openssl_random_pseudo_bytes($ivSize);
        $encrypted = openssl_encrypt($value, 'BF-ECB', $new_privateKey, OPENSSL_RAW_DATA, $iv);
        $encrypted = encode_params($encrypted);
        return  $encrypted;
}
?>
