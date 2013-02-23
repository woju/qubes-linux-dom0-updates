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


clean:

