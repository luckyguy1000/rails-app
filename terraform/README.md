## How to use

#### 1. Make sure you have AWS credentials you are going to use with Amazon RDS.

1. Sign up for [an AWS account](https://docs.aws.amazon.com/IAM/latest/UserGuide/getting-set-up.html) if you don't have one yet.
1. Log in onto the console and create [a new IAM user](https://console.aws.amazon.com/iam/home#/home).
1. Select your newly created user to access its details. Navigate to **Security credentials > Create a new access key**.

   NOTE: **Note:**
   A new **Access key ID** and **Secret access key** pair will be generated. Please take a note of them right away.

#### 2. Set AWS credentials as CI/CD variables in GitLab.

In your GitLab project, go to **Settings > CI / CD**. Set the following as
[environment variables](../variables/README.md#gitlab-cicd-environment-variables)
(see table below):

- Access key ID.
- Secret access key.

| Env. variable name      | Value                  |
|:------------------------|:-----------------------|
| `AWS_ACCESS_KEY_ID`     | Your Access key ID     |
| `AWS_SECRET_ACCESS_KEY` | Your Secret access key |

#### 3. Set Terraform CI/CD variables in GitLab

Its up to you to generate a secure password and set is as variable below. 
You can use the same password later to connect to the database

| Env. variable name      | Value                  |
|:------------------------|:-----------------------|
| `TF_VAR_password`       | Your DB user password  |

