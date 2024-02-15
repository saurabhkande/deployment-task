#FROM public.ecr.aws/lambda/python:3.8

#COPY app.py /var/task/

#CMD ["app.lambda_handler"]


FROM 787367675716.dkr.ecr.ap-south-1.amazonaws.com/nginx:latest

COPY index.html /usr/share/nginx/html/

EXPOSE 80


