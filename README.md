# README

Logins:

Development site:

[regular admin]
  email: admin@example.com
  password: secret

[Limited to worker's comp form]
  email: workers_comp@example.com
  password: secret

[Limited to Clinical trials page]
  email: clinical_trials@example.com
  password: secret

Production site:

email: info@uoc.com
password: Blue101?


=============
SSL Certificate

Steps taken the first time I generated a certificate. I guess the instructions were from Heroku.



1.
Use openssl to generate a new private key.

$ openssl genrsa -des3 -out server.pass.key 2048
Generating RSA private key, 2048 bit long modulus
......................................................................................+++
......+++
e is 65537 (0x10001)
Enter pass phrase for server.pass.key:
Verifying - Enter pass phrase for server.pass.key:


[The password is ariberto]


2.
The private key needs to be stripped of its password so it can be loaded without manually entering the password.

$ openssl rsa -in server.pass.key -out server.key
Enter pass phrase for server.pass.key:
writing RSA key


[The password I entered is the same: ariberto]

You now have a server.key private key file in your current working directory.



3.
Generate CSR

--------------------------------------------------------------------------------
$ openssl req -nodes -new -key server.key -out server.csr

You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:US
State or Province Name (full name) [Some-State]:Pennsylvania
Locality Name (eg, city) []:
Organization Name (eg, company) [Internet Widgits Pty Ltd]:University Orthopedics Center, Ltd.
Organizational Unit Name (eg, section) []:Healthcare
Common Name (e.g. server FQDN or YOUR name) []:www.uoc.com
Email Address []:Lschreffler@uoc.com

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:ariberto
An optional company name []:
--------------------------------------------------------------------------------


I received the certificate from the client.

I got these files that I copied in the uoc directory:


IntermediateCA.crt
ssl_certificate.crt


1. Create the endpoint add-on

$ heroku addons:create ssl:endpoint
Creating ssl-elliptical-97566... done, ($20.00/month)
Adding ssl-elliptical-97566 to uoc... done
Next add your certificate with `heroku certs:add CERT KEY`.
Use `heroku addons:docs ssl` to view documentation.


2. Add certificate and intermediaries

Add your certificate, any intermediate certificates, and private key to the endpoint with the certs:add command.



$ heroku certs:add ssl_certificate.crt IntermediateCA.crt server.key
Resolving trust chain... done
Adding SSL Endpoint to uoc... done
uoc now served by yamanashi-31301.herokussl.com
Certificate details:
Common Name(s): uoc.com
                www.uoc.com

Expires At:     2018-02-19 23:59 UTC
Issuer:         /C=US/O=thawte, Inc./CN=thawte EV SSL CA - G3
Starts At:      2016-02-09 00:00 UTC
Subject:        /1.3.6.1.4.1.311.60.2.1.3=US/1.3.6.1.4.1.311.60.2.1.2=Pennsylvania/businessCategory=Private Organization/O=University Orthopedics Center, Ltd./serialNumber=2020197/C=US/ST=Pennsylvania/L=State College/OU=Healthcare/CN=www.uoc.com
SSL certificate is verified by a root authority.


---

Verify the details of the SSL configuration with heroku certs.

$ heroku certs
Endpoint                       Common Name(s)        Expires               Trusted
-----------------------------  --------------------  --------------------  -------
yamanashi-31301.herokussl.com  www.uoc.com, uoc.com  2018-02-19 23:59 UTC  True

---

To get the detailed information about a certificate, use certs:info.

$ heroku certs:info
Fetching SSL Endpoint yamanashi-31301.herokussl.com info for uoc... done
Certificate details:
Common Name(s): uoc.com
                www.uoc.com

Expires At:     2018-02-19 23:59 UTC
Issuer:         /C=US/O=thawte, Inc./CN=thawte EV SSL CA - G3
Starts At:      2016-02-09 00:00 UTC
Subject:        /1.3.6.1.4.1.311.60.2.1.3=US/1.3.6.1.4.1.311.60.2.1.2=Pennsylvania/businessCategory=Private Organization/O=University Orthopedics Center, Ltd./serialNumber=2020197/C=US/ST=Pennsylvania/L=State College/OU=Healthcare/CN=www.uoc.com
SSL certificate is verified by a root authority.


---

Visit the endpoint with https: https://yamanashi-31301.herokussl.com/

This will throw a certificate error:

--------------------------------------
Your connection is not private

Attackers might be trying to steal your information from yamanashi-31301.herokussl.com (for example, passwords, messages, or credit cards).

NET::ERR_CERT_COMMON_NAME_INVALID
--------------------------------------

This means that you are serving up the certificate that you’d expect to serve (just not for the requested herokussl.com domain).

---

DNS and domain configuration

Once the SSL endpoint is provisioned and your certificate is confirmed, you must route requests for your secure domain through the endpoint URL.

Unless you’ve already done so, add the domain specified when generating the CSR to your app with:
$ heroku domains:add www.example.com

[I already added www.uoc.com so I am not doing this step]



-----

If you’re securing a subdomain, for example, www.example.com, modify your DNS settings and create a CNAME record to the endpoint or modify the CNAME target if you already have a CNAME record.
Record	Name	Target
CNAME	www	example-2121.herokussl.com.

[

I am asking Lance to modify the CNAME record to the new ssl endpoint

from:

Record: CNAME
Name: www
Target: uoc.herokuapp.com

to:

Record: CNAME
Name: www
Target: yamanashi-31301.herokussl.com

]

-----


RENEWING CERTIFICATE (2-15-2018)

Step 1.

Lance sent me this link for the new certificate. This is the link to the page for downloading the renewed certificate:

https://getcert.thawte.com/process/trust/home?digest=d79723931252e28ba2383e8f7606f8cc&language=en


Page says:
Confirm your server platform before downloading your certificate.

I choose:
- Apache
- HTTP server

After making these choices, it tells me:
Certificate format: X509

Click "Download" button

---

Step 2.

It downloads a zip file that contains a directory with this structure.

USUNIVX5955-2X
├── IntermediateCA.crt
├── SSLAssistant
│   ├── eula.txt
│   ├── readme_installcert.txt
│   └── sslassistant_installcert.sh
├── getting_started.txt
└── ssl_certificate.crt

I need to use both `ssl_certificate.crt` and `IntermediateCA.crt` files.

---

Step 3.

Copy `ssl_certificate.crt` and `IntermediateCA.crt` to Sites/uoc directory.

---

Step 4.

Update the certificates with the following command.
The file `server.key` is already in the `uoc` directory and it's the one used originally.


$ heroku certs:update ssl_certificate.crt IntermediateCA.crt server.key
Resolving trust chain... done
 ▸    Potentially Destructive Action
 ▸    This command will change the certificate of endpoint yamanashi-31301
 ▸    (yamanashi-31301.herokussl.com) from ⬢ uoc.
 ▸    To proceed, type uoc or re-run this command with
 ▸    --confirm uoc

> uoc
Updating SSL certificate yamanashi-31301 (yamanashi-31301.herokussl.com) for ⬢ uoc... done
Updated certificate details:
Common Name(s): www.uoc.com
                uoc.com
Expires At:     2020-02-20 07:00 UTC
Issuer:         /C=US/O=DigiCert Inc/OU=www.digicert.com/CN=Thawte EV RSA CA 2018
Starts At:      2018-02-12 19:00 UTC
Subject:        /businessCategory=Private Organization/jurisdictionC=US/jurisdictionST=Pennsylvania/serialNumber=2020197/C=US/ST=Pennsylvania/L=State College/O=University Orthopedics Center, Ltd./OU=Healthcare/CN=www.uoc.com
SSL certificate is verified by a root authority.




## SSL problem with images

UOC:

US East (N. Virginia)
us-east-1

UOC slide image served on http
http://com.uocproduction.s3.amazonaws.com/photos/4/large.jpg?1506620573

Doesn't work if I just add https at the front, but it works with this URL
https://s3.us-east-1.amazonaws.com/com.uocproduction/photos/4/large.jpg?1506620573


BAM: 

US East (Ohio)
us-east-2

BAM slide image served on https
https://s3.us-east-2.amazonaws.com/com.bellefonteart-production/store/78172d1dc72b461da0ae27df1c927366.jpg


old_url = 'http://com.uocdevelopment.s3.amazonaws.com'
new_url = 'https://s3.us-east-1.amazonaws.com/com.uocdevelopment'
slide.photo.url.gsub(old_url, new_url)



https://com.uocdevelopment.s3.us-east-1.amazonaws.com/photos/14/original.jpg?1506544918

needs to be changed to:

https://s3.us-east-1.amazonaws.com/com.uocdevelopment/photos/14/original.jpg?1506544918




bucket = /com\.uocdevelopment\./
hostname = /https:\/\/s3\.us-east-1\.amazonaws\.com\//

slide.photo.url.gsub(bucket, '').gsub(hostname, bucket.chop)



bucket = "com.uocdevelopment/"
bucket_regexp = /com\.uocdevelopment\./
new_url = slide.photo.url.gsub(bucket_regexp, '')

# https://s3.us-east-1.amazonaws.com/photos/14/original.jpg?1506544918

new_url.insert(35, bucket)


