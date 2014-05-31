package com.bt.service;

import com.amazonaws.auth.ClasspathPropertiesFileCredentialsProvider;
import com.amazonaws.services.sns.AmazonSNSClient;
import com.amazonaws.services.sns.model.PublishRequest;
import com.amazonaws.services.sns.model.PublishResult;

public class AwsClient {

	public static void main(String[] args) {
		AmazonSNSClient client = new AmazonSNSClient(new ClasspathPropertiesFileCredentialsProvider());
		PublishRequest request = new PublishRequest("arn:aws:sns:ap-northeast-1:651797352322:MyTopic", "test mesage", "test");
//		PublishResult result = client.publish("arn:aws:sns:ap-northeast-1:651797352322:MyTopic", "test mesage", "test");
		PublishResult result = client.publish(request);
		System.out.println(result.toString());
	}

}
