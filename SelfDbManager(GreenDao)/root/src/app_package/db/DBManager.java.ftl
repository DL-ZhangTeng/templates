package ${packageName}.db;

import android.app.Application;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;

import ${packageName}.db.bean.User;
import ${packageName}.db.dao.DaoMaster;
import ${packageName}.db.dao.DaoSession;
import ${packageName}.db.dao.UserDao;

import org.greenrobot.greendao.query.DeleteQuery;

import java.util.List;

/**
 * Created by Lanxumit on 2017/9/5.
 * 使用前请先初始化context
 */

public class DBManager {
    private static DBManager dbManager = null;
    private DaoMaster.DevOpenHelper openHelper;
    private static Context context = null;

    public static synchronized DBManager instance() {
        if (dbManager == null) {
            synchronized (DBManager.class) {
                if (dbManager == null) {
                    dbManager = new DBManager();
                    dbManager.initDbHelp(context);//此处使用context
                }
            }
        }
        return dbManager;
    }

    private DBManager() {
    }

    public void close() {
        if (openHelper != null) {
            openHelper.close();
            openHelper = null;
            context = null;
        }
    }


    public void initDbHelp(Context ctx) {
        context = ctx;
        close();
        DaoMaster.DevOpenHelper helper = new DaoMaster.DevOpenHelper(ctx, "GreenDaoModule.db", null);
        this.openHelper = helper;
    }


    public DaoSession openReadableDb() {
        isInitOk();
        SQLiteDatabase db = openHelper.getReadableDatabase();
        DaoMaster daoMaster = new DaoMaster(db);
        DaoSession daoSession = daoMaster.newSession();
        return daoSession;
    }


    public DaoSession openWritableDb() {
        isInitOk();
        SQLiteDatabase db = openHelper.getWritableDatabase();
        DaoMaster daoMaster = new DaoMaster(db);
        DaoSession daoSession = daoMaster.newSession();
        return daoSession;
    }


    private void isInitOk() {
        if (openHelper == null) {
            //   FileLog.e("DBManager", "DBManager#isInit not success or start,cause by openHelper is null");

            throw new RuntimeException("DBManager#isInit not success or start,cause by openHelper is null");
        }
    }

    public void insertUser(User user) {
        DBManager.instance().openWritableDb().getUserDao().insert(user);
    }

    public void deleteUser(User user) {
        DBManager.instance().openWritableDb().getUserDao().delete(user);
    }

    public void updateUser(User user) {
        UserDao userDao = DBManager.instance().openWritableDb().getUserDao();
        DeleteQuery<User> deleteQuery = userDao.queryBuilder().where(UserDao.Properties.Id.eq(user.getId())).where(UserDao.Properties.Name.eq(user.getName())).buildDelete();
        deleteQuery.executeDeleteWithoutDetachingEntities();
        userDao.insertOrReplace(user);
    }

    public List<User> queryUser(User user) {
        UserDao userDao = DBManager.instance().openReadableDb().getUserDao();
        List<User> list = userDao.queryBuilder().where(UserDao.Properties.Name.eq(user.getName())).build().list();
        return list;
    }
}
