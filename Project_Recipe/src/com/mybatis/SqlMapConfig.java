package com.mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	private static SqlSessionFactory sqlSession;
	
	static{
		String resourse = "com/config/mybatis-config.xml";
		try{
			Reader reader = Resources.getResourceAsReader(resourse);
			sqlSession = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getSqlSession() {
		return sqlSession;
	}
}
