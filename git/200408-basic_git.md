# Basic Git  

## Contents  

### Git  

##### Flow  

```  
- Direction  
Workspace -(add)-> Index -(Commit)-> Repository -(push)-> Remote  

-Reverse  
Remote -(fetch)-> Repository  
Remote -(pull)-> Repository, Workspace  
Remote -(clone)-> Workspace  
```		

##### Git Syntex  
#####All Git Syntex first word is git !  
#####Today Learned list  

```
   status    Show the working tree status  
   init      Create an empty Git repository or reinitialize an existing one  
   add       Add file contents to the index  
   commit    Record changes to the repository  
   push      Update remote refs along with associated objects  
   clone     Clone a repository into a new directory  
```

#### Create TIL (Remote Repositories)  

```  
- Git install & config  
	1. Git Install  
		1-1. brew install git  
		1-2. check git version !  

	2. Git Config  
		2-1. git config --global user.namne [username]  
		2-2. git config --global user.email [email]  
		2-3. git config --global user.editor [ex.vim]  
		2-4. git config --global user.page [ex.cat]  
		2-5. check git config --list !  

	3. Git Connect  
		3-1. git init (workspace start sourcecord sending)  
		3-2. mkdir first-git-repo && cd first-git-repo (gitHub repo name== dir name)  
		3-3. git remote add orign [url]  
		3-4. check git remote get-url; origin !  

	4. Create README.md  
		4-1. touch README.md && vi README.md (edtior)  

	5. Git Start  
		5-1. git status  
		5-2. git add README.md  
		5-3. git git commit  
		5-4. git git push origin master  
```  

## TODO  

- Git Review  
- hexo Review   

