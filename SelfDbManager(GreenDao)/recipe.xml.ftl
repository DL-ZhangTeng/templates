<?xml version="1.0"?>
<recipe>
	<dependency mavenUrl="org.greenrobot:greendao:3.2.0"/>
	
    <instantiate from="root/src/app_package/db/DBManager.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/db/DBManager.java" />
	<instantiate from="root/src/app_package/db/bean/User.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/db/bean/User.java" />
	<instantiate from="root/src/app_package/db/dao/DaoMaster.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/db/dao/DaoMaster.java" />			   
	<instantiate from="root/src/app_package/db/dao/DaoSession.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/db/dao/DaoSession.java" />			   
	<instantiate from="root/src/app_package/db/dao/UserDao.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/db/dao/UserDao.java" />			   
				   
	<open file="${escapeXmlAttribute(srcOut)}/db/DBManager.java" />
</recipe>
