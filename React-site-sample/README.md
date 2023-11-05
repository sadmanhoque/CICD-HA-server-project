# Getting Started with Create React App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

## Docker Commands

`docker image build -t sample-site:latest .`

Builds the image and saves it locally

`docker run -d --rm -p 3000:3000 --name react-container sample-site`

This command runs a container locally using the image build, useful for testing if the site works.

## ECR upload commands

Note that these commands and descriptions are directly copied from ECR console, the account ID and repo name used are the ones for the specific repo and account used when testing and will be different in other accounts.

Retrieve an authentication token and authenticate your Docker client to your registry.
Use the AWS CLI:
`aws ecr get-login-password --region ca-central-1 | docker login --username AWS --password-stdin 516532666009.dkr.ecr.ca-central-1.amazonaws.com`
Note: If you receive an error using the AWS CLI, make sure that you have the latest version of the AWS CLI and Docker installed.

Build your Docker image using the following command. For information on building a Docker file from scratch see the instructions. You can skip this step if your image is already built.

`docker build -t sample-site .`

After the build completes, tag your image so you can push the image to this repository:

`docker tag sample-site:latest 516532666009.dkr.ecr.ca-central-1.amazonaws.com/test-repo:latest`

Run the following command to push this image to your newly created AWS repository:

`docker push 516532666009.dkr.ecr.ca-central-1.amazonaws.com/test-repo:latest`


