package ${packageName}.adapter;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;

import ${packageName}.base.BaseFragment;
import ${packageName}.fragment.${fragmentNameO};
import ${packageName}.fragment.${fragmentNameT};

import java.util.ArrayList;

/**
 * Created by Lanxumit on 2017/11/24.
 */

public class ${adapterClass} extends FragmentPagerAdapter {
    private String[] titles = {"pager1", "pager2"};
    private ArrayList<Fragment> fragmentlist = new ArrayList<Fragment>();
    private String selectClassId;

    public ArrayList<Fragment> getFragmentlist() {
        return fragmentlist;
    }


    public ${adapterClass}(FragmentManager fm, String selectClassId) {
        super(fm);
        this.selectClassId = selectClassId;
    }


    @Override
    public Fragment getItem(int position) {
        BaseFragment fragment = null;
        switch (position) {
            case 0:
                fragment = new ${fragmentNameO}();
                break;
            case 1:
                fragment = new ${fragmentNameT}();
                break;
            default:
                break;
        }
        fragmentlist.add(fragment);
        return fragment;
    }

    @Override
    public CharSequence getPageTitle(int position) {
        return titles[position];
    }

    @Override
    public int getCount() {
        return titles.length;
    }
}
