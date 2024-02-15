import boto3

def lambda_handler(event, context):
    # Initialize the ECS client
    ecs = boto3.client('ecs', region_name='ap-south-1')

    # Define the ECS cluster and service names
    cluster_name = 'ecs_poc_cluster'
    service_name = 'poc-task-service'
    family_name = 'Poc-task-definition'

    try:
        # List task definitions for the specified family
        response = ecs.list_task_definitions(familyPrefix=family_name, sort='DESC')

        # Get the latest task definition ARN
        latest_task_definition_arn = response['taskDefinitionArns'][0]

        # Log the latest task definition ARN
        print("Latest task definition ARN for family '{}' is '{}'".format(family_name, latest_task_definition_arn))

        # Update the ECS service with the latest task definition
        response = ecs.update_service(
            cluster=cluster_name,
            service=service_name,
            taskDefinition=latest_task_definition_arn
        )

        # Log the success message
        print("Successfully updated ECS service '{}' in cluster '{}' to use task definition '{}'".format(service_name, cluster_name, latest_task_definition_arn))

        # Return a success message
        return {
            'statusCode': 200,
            'body': 'ECS service updated successfully'
        }

    except Exception as e:
        # Log and return any errors that occur
        print("Error updating ECS service: {}".format(str(e)))
        return {
            'statusCode': 500,
            'body': 'Error updating ECS service: {}'.format(str(e))
        }


