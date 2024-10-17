Infrastructure Setup
 
The diagram illustrates the infrastructure for a static website deployment using AWS services and GitHub Actions,First I created as it was on the task photo but then I decided to modify it and This is how I modified the initial task infra:![epam](https://github.com/user-attachments/assets/57782493-f503-4593-a7b1-dd53e57dcdfb)

1.	GitHub Repository: Code for the static website resides in a GitHub repository.
2.	GitHub Actions: On every push to the repository, a CI/CD pipeline triggers. GitHub Actions automatically deploys the website by uploading updated content to the Amazon S3 bucket.
3.	Amazon S3: The S3 bucket stores the static website files. It is configured for Origin Access Control, which ensures only CloudFront can fetch content from S3, enhancing security.
4.	Amazon CloudFront: CloudFront serves the website globally through its edge locations, providing faster delivery, caching, and enforcing HTTPS for secure access.
5.	User: End-users access the website over HTTPS through CloudFront, ensuring secure and optimized content delivery.

Amazon S3
1.	Create S3 Bucket
First, create an Amazon S3 bucket to host your static website. 
S3 Configuration:
o	Create a new bucket with a globally unique name.
o	In the bucket settings, enable static website hosting.
o	Set the index.html as the default root object.
CloudFront
To enhance the website's performance, security, and global availability, I added Amazon CloudFront in front of S3. CloudFront provides(it was not in the task but still):
•	Caching: Improves loading speed by caching content closer to the user.
•	HTTPS: Provides secure communication with SSL/TLS encryption.
•	URL Redirection: Helps redirect traffic to the correct URL format (www vs non-www).
Terraform Setup
 ![image](https://github.com/user-attachments/assets/e8c90bca-80b5-40e1-ae7f-007cafeb94c0)

1.	Clone the repository
I made public repository with Terraform code
git clone https://github.com/Annatar3/static-s3-terraform
Cd static-s3-terraform
2.	Initialize Terraform
Make sure you are in your project directory where your main.tf resides, and run:
terraform init
3.	Apply Terraform Configuration
Once everything is set, apply the changes to create the infrastructure:
terraform apply
Confirm the changes, and Terraform will provision your S3 bucket and CloudFront distribution. After all this test page will be hosted,because in repository we had sample index.html.In future we can add Iac Pipeline as well.
 ![image](https://github.com/user-attachments/assets/75c5085b-2ad5-47cf-b4cd-230a065daf9a)


CI/CD with GitHub Actions
Now that the infrastructure is provisioned, we need to set up a GitHub Actions pipeline for continuous deployment. When a new commit is pushed to the repository, the updated files will be automatically uploaded to S3.
1.	Create GitHub Repository
Create a new private repository on GitHub and push your project files. Make sure to include your index.html file.
2.	GitHub Actions Workflow
Create a .github/workflows/deploy.yml file in your repository to define the CI/CD pipeline.
3.	All the secrets are stored in Github Repository Secrets and we retrieve them from there
See the deploy.yml in .github/wokflows/ dir.
 
New website after CI/CD
 ![image](https://github.com/user-attachments/assets/64b43b8c-1c8d-440c-ae16-cb80e20e8489)

Advantages of CloudFront
By placing CloudFront in front of the S3 bucket, we gain several advantages:
•	Global Content Delivery: CloudFront distributes the content across its global edge locations, making the website load faster for users around the world.
•	Caching: CloudFront caches content at its edge locations, reducing latency and load on the origin S3 bucket.
•	HTTPS Support: By default, CloudFront allows secure HTTPS connections, improving the security of the website and ensuring data encryption.
•	URL Redirection: The viewer_protocol_policy = "redirect-to-https" setting ensures that all HTTP traffic is automatically redirected to HTTPS, maintaining security.
•	Reduced S3 Costs: CloudFront helps reduce S3 access costs by serving cached content.

Accessing the Website
You can access the website via two URLs:
1.	CloudFront URL: Your CloudFront distribution will have its own URL (e.g., https://d3rpmvqtiokd83.cloudfront.net/)
2.	Custom Domain: If you've configured a custom domain and set up URL redirection, the website will be accessible via your domain (e.g., http://toxicniko.me).


