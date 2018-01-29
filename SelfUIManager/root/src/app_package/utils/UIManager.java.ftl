package ${packageName}.utils;

import android.annotation.SuppressLint;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;

import ${packageName}.base.BaseDialogFragment;
import ${packageName}.base.BaseFragment;

/**
 * Created by swing on 2017/11/28.
 */

public final class UIManager implements FragmentManager.OnBackStackChangedListener {
    private static final String TAG = "UIManager";
    public static int position = -1;
    private static UIManager instance;
    private FragmentManager fragmentManager;
    private BaseFragment currentFragment;


    private UIManager() {
    }

    public static UIManager getInstance() {
        if (instance == null) {
            synchronized (UIManager.class) {
                if (instance == null) {
                    instance = new UIManager();
                }
            }
        }
        return instance;
    }

    public String getFragmentName() {
        if (currentFragment != null) {
            String fragmentName = currentFragment.getClass().getSimpleName();
            return fragmentName;
        }
        return null;
    }

    public void setCurrentFragment(BaseFragment fragment) {
        currentFragment = fragment;
    }

    public BaseFragment getCurrentFragment() {
        return this.currentFragment;
    }

    public void init(FragmentManager fragmentManager, BaseFragment currentFragment) {
        this.currentFragment = currentFragment;
        this.fragmentManager = fragmentManager;
        this.fragmentManager.addOnBackStackChangedListener(this);
    }

    @SuppressLint("RestrictedApi")
    @Override
    public void onBackStackChanged() {
        if (null != fragmentManager.getFragments()) {
            int pos = fragmentManager.getFragments().size();
            if (pos >= 1) {
                for (int i = pos - 1; i >= 0; i--) {
                    if (fragmentManager.getFragments().get(i) instanceof BaseFragment) {
                        BaseFragment item = (BaseFragment) fragmentManager.getFragments().get(i);
                        if (item != null) {
                            currentFragment = item;
                            break;
                        }
                    }
                }
            }
            if (currentFragment != null) {
                currentFragment.onFragmentBackOrComing();
            }
        }
    }


    public void switchFragment(int from, BaseFragment to) {//from = R.id.root
        if (currentFragment != to) {
            FragmentTransaction transaction = fragmentManager.beginTransaction();//.setCustomAnimations(
            if (!to.isAdded()) {    // 先判断是否被add过
                transaction.hide(currentFragment).add(from, to, to.getClass().getName()).addToBackStack(to.getClass().getSimpleName()).commit(); // 隐藏当前的fragment，add下一个到Activity中
            } else {
                transaction.hide(currentFragment).show(to).addToBackStack(to.getClass().getSimpleName()).commit(); // 隐藏当前的fragment，显示下一个
            }
            currentFragment = to;
            if (currentFragment != null) {
                currentFragment.onFragmentBackOrComing();
            }
        }
    }

    public void nav(String fragmentName) {
        int count = fragmentManager.getBackStackEntryCount();
        for (int i = 0; i < count; i++) {
            FragmentManager.BackStackEntry entry = fragmentManager.getBackStackEntryAt(i);
            BaseFragment current = (BaseFragment) fragmentManager.findFragmentByTag(entry.getName());
            if (current != null) {

            }
        }
    }

    @SuppressLint("RestrictedApi")
    public void back() {
        int pos = fragmentManager.getFragments().size();
        if (fragmentManager.getFragments().get(pos - 1) instanceof BaseDialogFragment) {
            return;
        }
        if (!finishActivity()) {
            fragmentManager.popBackStack();
        }
    }

    @SuppressLint("RestrictedApi")
    public BaseFragment getFragmentByName(String name) {
        int pos = fragmentManager.getFragments().size();
        for (int i = pos - 1; i >= 0; i--) {
            BaseFragment item = (BaseFragment) fragmentManager.getFragments().get(i);
            if (item != null && item.getClass().getName().equals(name)) {
                return item;
            }
        }
        return null;
    }

    @SuppressLint("RestrictedApi")
    public int getFragmentPositionByName(String name) {
        int pos = fragmentManager.getFragments().size();
        for (int i = pos - 1; i >= 0; i--) {
            BaseFragment item = (BaseFragment) fragmentManager.getFragments().get(i);
            if (item != null && item.getClass().getName().equals(name)) {
                return i;
            }
        }
        return 0;
    }

    @SuppressLint("RestrictedApi")
    public boolean finishActivity() {
        if (currentFragment == null) {
            return false;
        }
        if (currentFragment == fragmentManager.getFragments().get(0)) {
            currentFragment.getActivity().finish();
            return true;
        }

        return false;
    }
}

