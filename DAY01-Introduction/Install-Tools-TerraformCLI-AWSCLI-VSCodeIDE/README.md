**Terraform Installation**

**Step-01: Introduction**

-   Install Terraform CLI

-   Install AWS CLI

-   Install Azure CLI

-   Install GCP CLI (gcloud)

**Step-02: Terraform Install (Windows/Linux/MAC)**

-   [Download Terraform](https://www.terraform.io/downloads.html)

-   Unzip the package

-   For Linux & MAC Move the file to /bin folder

-   For Windows Move the file to Program Files folder and set the
    environment variable

    -   set PATH=%PATH%;"C:\\Program Files\\terraform"

\# Verify Version

terraform version

**Step-03: Install AWS CLI**

-   [AWS CLI
    Install](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) -
    Follow the instruction

**Step-04: MACOS: Configure AWS Credentials**

-   **Pre-requisite:** Should have AWS Account.

    -   [Create an AWS
        Account](https://portal.aws.amazon.com/billing/signup?nc2=h_ct&src=header_signup&redirect_url=https%3A%2F%2Faws.amazon.com%2Fregistration-confirmation#/start)

-   Generate Security Credentials using AWS Management Console

    -   Go to Services -\> IAM -\> Users -\> \"Your-Admin-User\" -\>
        Security Credentials -\> Create Access Key

-   Configure AWS credentials using SSH Terminal on your local desktop

\# Configure AWS Credentials in command line

\$ aws configure

AWS Access Key ID \[None\]: AKIASUF7DEFKSIAWMZ7K

AWS Secret Access Key \[None\]: WL9G9Tl8lGm7w9t7B3NEDny1+w3N/K5F3HWtdFH/

Default region name \[None\]: us-east-1

Default output format \[None\]: json

\# Verify if we are able list S3 buckets

aws s3 ls

-   Verify the AWS Credentials Profile

cat \$HOME/.aws/credentials

**Step-05: Install Azure CLI**

-   [Install Azure
    CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli?source=recommendations)

-   Verify Azure CLI installation by executing -\> az \--version

-   Authenticate Azure CLI

    -   az login

-   Provide Azure portal credential to authenticate your CLI

**Step-06: GCP CLI (gcloud)**

-   [Install gcloud](https://cloud.google.com/sdk/docs/install)

-   Verify gcloud CLI installation by executing -\> gcloud \--version

-   Authenticate gcloud CLI

    -   gcloud auth login

-   Provide GCP portal credential to authenticate your CLI
