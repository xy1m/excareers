package com.excareers.action;

import java.io.File;

import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class AwsTest {
	public static void main(String args[]) {
		String buckedName = "excareers";
		String keyName = "mole2.jpg";
		AmazonS3Client s3 = new AmazonS3Client();
		File file = new File("d:\\mole.jpg");
		PutObjectRequest por = new PutObjectRequest(buckedName, keyName, file);
		por.setCannedAcl(CannedAccessControlList.PublicRead);
		s3.putObject(por);
		System.out.println(s3.getUrl("excareers", "mole2.jpg"));

	}
}
