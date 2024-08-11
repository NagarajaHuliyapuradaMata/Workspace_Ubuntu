cd ./repo_submodules/SwcServiceStartup
git add .
git commit -m "vR0.0.1"
git tag -a "vR0.0.1" -m "vR0.0.1"
git push
git push origin vR0.0.1

cd ../../repo_projects/pProjectFull
git add .
git commit -m "vR0.0.1"
git tag -a "vR0.0.1" -m "vR0.0.1"
git push
git push origin vR0.0.1

cd ../..
git add .
git commit -m "vR0.0.1"
git tag -a "vR0.0.1" -m "vR0.0.1"
git push
git push origin vR0.0.1

