DIST_DOM0 ?= fc13

stage0:
	rpmbuild --define "_rpmdir rpm/" -bb qubes-dom0-upgrade-packages-placeholder.spec
	./patch-and-build-libdb.sh libdb-*.src.rpm

stage1:
	./patch-and-build-rpm.sh rpm-*.src.rpm

stage2:
	rpmbuild --rebuild --define "_rpmdir rpm/" deltarpm-*.src.rpm

stage3:
	true

stage4:
	true

update-repo-upgrade:
	ln -f rpm/noarch/rpm*$(DIST_DOM0).noarch.rpm ../yum/r1/current/dom0-upgrade-r2/rpm/
	ln -f rpm/x86_64/libdb*$(DIST_DOM0).x86_64.rpm ../yum/r1/current/dom0-upgrade-r2/rpm/
	ln -f rpm/x86_64/delta*$(DIST_DOM0).x86_64.rpm ../yum/r1/current/dom0-upgrade-r2/rpm/
	ln -f rpm/x86_64/rpm*$(DIST_DOM0).x86_64.rpm ../yum/r1/current/dom0-upgrade-r2/rpm/
	ln -f rpm/x86_64/qubes-dom0-upgrade-packages-placeholder*$(DIST_DOM0).x86_64.rpm ../yum/r1/current/dom0-upgrade-r2/rpm/

clean:

