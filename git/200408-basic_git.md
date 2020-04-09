# Basic Git & Hexo

## Contents  
1. Git  
2. Hexo  

### Git 

```
- What Is Git ?
[Git](https://git-scm.com/) 
```

##### Git Flow  

```  
- Direction  
Workspace -(add)-> Index -(Commit)-> Repository -(push)-> Remote  

-Reverse  
Remote -(fetch)-> Repository  
Remote -(pull)-> Repository, Workspace  
Remote -(clone)-> Workspace  
```		

##### Git Syntex  

```
   status    Show the working tree status  
   init      Create an empty Git repository or reinitialize an existing one  
   add       Add file contents to the index  
   commit    Record changes to the repository  
   push      Update remote refs along with associated objects  
   clone     Clone a repository into a new directory  
   fetch     Download objects and refs from another repository
   pull      Fetch from and integrate with another repository or a local branch
```

#### Create TIL (Remote Repositories)  

```  
- Git install & config  
	1. Git Install  
		1-1. brew install git  
		1-2. check git --version !  

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

*****

### Hexo  

```  
- What is Hexo ?  
[Hexo](https://hexo.io/ko/index.html)  
```  

##### Work Flow    
```
Install Npm(node.js) -> Install Hexo(cli) -> Create Blog -> Git Connect(repo) -> Theme(next) Apply  
```  

##### Hexo Syntex    
```  
  version   Display version information.  
  init      Create a new Hexo folder.  
  server    Start the server.  
  clean     Remove generated files and cache.  
  generate  Generate static files.  
  deploy    Deploy your website  

  --config  Specify config file instead of using _config.yml  
  --safe    Disable all plugins and scripts.  
```

#### Create Blog  
``` 
- Hexo install & config 
	1. Install Npm(node.js)  
	2. Install Hexo  
		2-1. npm install -g hexo-cli  
		2-2. check npm --version !  
	3. Create Blog  
		3-1. hexo init JWblog  
		3-2. cd JWblog && npm install(update)  
		3-3. hexo new poset start-git && vi start-git(edtior)  
		3-4. hexo clean && hexo generate  
		3-5. hexo server(check local server)  
	4. Git Connect(repo)
		4-1. npm install --save-dev hexo-deployer-git  
		4-2. vi _config.yml  
			* url : [JWBlog url]  
			* type : git  
			* repo : [github url]  
		4-3. hexo clean && hexo deploy  
	5. Theme(next) Apply  
		5-1. install Theme  
			* [hext_git](https://github.com/theme-next/hexo-theme-next)  
			* git clone https://github.com/theme-next/hexo-theme-next themes/next  
		5-2. vi _config.yml  
			* theme : next  
		5-3 hexo clean && hexo depoly  
```  		
## TODO  

- Git Review  
- hexo Review   

