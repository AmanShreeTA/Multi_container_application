# Multi_container_application

## Docker Assignment:
 - Create a folder named multi-container-app
 - Create a folder named node.
 - Add the files Myserver.js, package.json in the node folder.
   
  **Myserver.js:**
  
	   const server = require(&quot;express&quot;)();
	   server.listen(3000, async () =&gt; { });
	   server.get(&quot;/super-app&quot;, async (_, response) =&gt; {
	   response.json({ &quot;super&quot;: &quot;app&quot; });
	   });

  **package.json:**
  
	   {
            "name": "super-app-node",
            "dependencies": {
            "express": "^4.17.1";
            }
           }

 - User the readily available docker image for mysql
 - Create a Dockerfile for Nodejs application
 - Write a docker file to dockerize this node.js application.
   - Download the slim version of node
   - Set the work directory to the app folder.
   - Copy package.json file in the node folder to inside container
   - Install the dependencies in the container
   - Copy the rest of the code in the container
   - Run the node server with Myserver.js file
   - EXPOSE 3000
 - Next, create a docker-compose.yml under this folder
 - Setup services in the docker-compose.yml file.
  - Under the services section , List all the types of applications to be configured
 - Fire up the containers.

**Verification:**
 - Now if you hit localhost:3000/super-app you will see a response {“super”:”app”}
 - Also understand the docker network between the docker containers.

## Steps done to create the multi container application:

 - Created the multi-container app folder and then created a node folder within it.
 - Copied the Myserver.js and package.json code in the respective files inside the node folder.
 - Created the Dockerfile for the NodeJS application:

		FROM node:slim
	
		WORKDIR /app
	
		COPY node/package.json .
	
		RUN npm install
	
		COPY node .
	
		EXPOSE 3000
	
		CMD ["node", "Myserver.js"]
 
 - Created the docker-compose file :
   
		version: '2'
		services:
		 node_app:
		  build: .
		  ports:
		   - 3000:3000
		  depends_on:
		   - mysql_db
		 mysql_db:
		  image: mysql 
 - Fired up the containers using the docker-compose.yml file:
   
		docker-compose up

## Screenshot of the running Application:
![Screenshot (20)](https://github.com/AmanShreeTA/Multi_container_application/assets/155889933/c08687e7-f89e-41cd-a7b5-9da4460ef72b)
![Screenshot (19)](https://github.com/AmanShreeTA/Multi_container_application/assets/155889933/ad4641cf-f13d-40c8-b60a-33167c3acd9a)

