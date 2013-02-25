Name:		qubes-dom0-upgrade-packages-placeholder
Version:	0.1
Release:	1%{?dist}
Summary:	Upgrade crap

Group:		System
License:	GPL
URL:		http://www.qubes-os.org/
BuildRoot:	%(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)

Provides:	kdm = 4.7
Provides:	/usr/bin/kdialog
Provides:	kdebase = 6:4.6.95-10
Provides:	oxygen-icon-theme
Provides:	lzma
Provides:	gnome-packagekit
Provides:	createrepo
%description


%prep

%build

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT

%clean
rm -rf $RPM_BUILD_ROOT


%files

%changelog

