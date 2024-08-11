cd ./repo_submodules/SwcServiceStartup
git add .
git commit -m "vR0.0.1"
git tag "vR0.0.1"
git push

cd ../../repo_projects/pProjectFull
git add .
git commit -m "vR0.0.1"
git tag "vR0.0.1"
git push

cd ../..
git add .
git commit -m "vR0.0.1"
git tag "vR0.0.1"
git push

