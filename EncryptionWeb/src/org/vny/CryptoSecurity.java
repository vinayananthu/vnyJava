package org.vny;

import java.security.Security;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

/**
 * Basic symmetric encryption example
 */
public class CryptoSecurity {
  public static void main(String[] args) throws Exception {
	  String cipher = new CryptoSecurity().encryptPassword("Helloo 123 ???!");
	  System.out.println(cipher);
	  String plain = new CryptoSecurity().decryptPassword(cipher);
	  System.out.println(plain);
  }
  
  public String encryptString(String plainText,int key){
	  StringBuffer input = new StringBuffer(plainText);
	  for(int i=0;i<input.length();i++){
		  int temp=0;
		  temp=(int)input.charAt(i);
		  temp=temp*key;
		  input.setCharAt(i, (char)temp);
	  }
	  String decipher = input.toString();
	  return decipher;
  }
  
  public String decryptString(String cipherText,int key){
	  System.out.println("Decrypting "+cipherText+" with "+key);
	  StringBuffer input = new StringBuffer(cipherText);
	  for(int i=0;i<input.length();i++){
		  int temp=0;
		  temp=(int)input.charAt(i);
		  temp=temp/key;
		  input.setCharAt(i, (char)temp);
	  }
	  String plain = input.toString();
	  System.out.println("Decrypted Text:"+plain);
	  return plain;
  }
  
  public String encryptPassword(String plainPassword){
	  StringBuffer input = new StringBuffer(plainPassword);
	  for(int i=0;i<input.length();i++){
		  int temp=0;
		  temp=(int)input.charAt(i);
		  temp=temp*14;
		  input.setCharAt(i, (char)temp);
	  }
	  String cipherPassword = input.toString();
	  System.out.println("Encrypted Text:"+cipherPassword);
	  return cipherPassword;
  }
  
  public String decryptPassword(String cipherPassword){
	  StringBuffer input = new StringBuffer(cipherPassword);
	  for(int i=0;i<input.length();i++){
		  int temp=0;
		  temp=(int)input.charAt(i);
		  temp=temp/14;
		  input.setCharAt(i, (char)temp);
	  }
	  String plain = input.toString();
	  System.out.println("Decrypted Text:"+plain);
	  return plain;
  }
}
  
