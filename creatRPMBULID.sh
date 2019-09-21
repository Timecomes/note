nstall  rpm-build
rpmbuild -ba nginx.spec
cp nginx-1.12.2.tar.gz /root/rpmbuild/SOURCES/
#touch /root/rpmbuild/SPECS/nginx.spec

#sed -i '1s/Name:/Name:nginx/' /root/rpmbuild/SPECS/nginx.spec
#sed -i '2s/Version:/Version:1.12.2 /' /root/rpmbuild/SPECS/nginx.spec
#sed -i '4s/Summary:/Summary: Nginx is a web server software. /' /root/rpmbuild/SPECS/nginx.spec
#sed -i '7s/License:/License:GPL/' /root/rpmbuild/SPECS/nginx.spec
#sed -i '8s/URL:/URL:    www.test.com /' /root/rpmbuild/SPECS/nginx.spec
#sed -i '9s/Source0:/Source0:nginx-1.12.2.tar.gz/' /root/rpmbuild/SPECS/nginx.spec
#sed -i '11s/.*/#/' /root/rpmbuild/SPECS/nginx.spec
#sed -i '12s/.*/#/' /root/rpmbuild/SPECS/nginx.spec
#sed -i '15s//nginx [engine x] is an HTTP and reverse proxy server./' /root/rpmbuild/SPECS/nginx.spec
#sed -i '22s/%/./\/' /root/rpmbuild/SPECS/nginx.spec
#sed -i '32s///\usr/local/nginx/* /' /root/rpmbuild/SPECS/nginx.spec

#echo "%post" >> /root/rpmbuild/SPECS/nginx.spec
#echo "useradd nginx" >> /root/rpmbuild/SPECS/nginx.spec

echo "Name:nginx                                   
Version:1.12.2                                    
Release:    10                                       
Summary: Nginx is a web server software.            
License:GPL                                        
URL:    www.test.com                                   
Source0:nginx-1.12.2.tar.gz                        
#BuildRequires:                                   
#Requires:                                       
%description
nginx [engine x] is an HTTP and reverse proxy server.    
%post
useradd nginx                             
%prep
%setup -q                              
%build
./configure
make %{?_smp_mflags}
%install
make install DESTDIR=%{buildroot}
%files
%doc
/usr/local/nginx/*                   
%changelog" > /root/rpmbuild/SPECS/nginx.spec

yum -y install  gcc  pcre-devel openssl-devel
rpmbuild -ba /root/rpmbuild/SPECS/nginx.spec
rpm -ivh /root/rpmbuild/RPMS/x86_64/nginx-1.12.2-10.x86_64.rpm

ls /root/rpmbuild/RPMS/x86_64/nginx-1.12.2-10.x86_64.rpm


