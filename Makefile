stage0:
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
	ln -f rpm/noarch/*.rpm ../yum/current-release/current/dom0-upgrade-r2/rpm/
	ln -f rpm/x86_64/*.rpm ../yum/current-release/current/dom0-upgrade-r2/rpm/


clean:

