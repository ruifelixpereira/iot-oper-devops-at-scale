# DevOps "at scale" with IoT Operations

There are 2 main approaches for doing devops at scale considering an IoT Operations context.
1. **Azure IoT Operations Orchestrator**: Allows you to manage and deploy your resources like Azure resources, using Azure Resource Manager that uses the IoT Orchestrator to synchronize configurations into the edge Kubernetes (all or part of). Check more details at [Azure IoT Operation documentation](https://learn.microsoft.com/en-us/azure/iot-operations/deploy-custom/overview-orchestrator).
2. **Arc-enabled Kubernetes GitOps**: Allows you to manage/commit configurations in a Git repository from where (all or part of) your edge Kubernetes pull the desired state using a GitOps engine named Flux. Check more details at [Azure Arc-enabled Kubernetes with GitOps documentation](https://learn.microsoft.com/en-us/azure/azure-arc/kubernetes/tutorial-use-gitops-flux2?tabs=azure-cli).

You can explore demos of both these scenarios: 
1. [Using IoT Orchestrator to deploy your custom app components](docs/orchestrator-custom-app.md): Shows how you can define manifest files (Solution, Target and Instance) to manage you custom application sitting in your own Git repo and deploy it to your edge K8s.
2. [Using IoT Orchestrator to deploy a simple scenario](docs/orchestrator-simple-hello-world.md): Shows a quick way to deploy a resource to your edge K8s only using a Target manifest
.3. [Using Arc-enabled Kubernetes GitOps](docs/gitops.md): Show how you can configure your edge K8s to start pulling changes from your Git repo.

