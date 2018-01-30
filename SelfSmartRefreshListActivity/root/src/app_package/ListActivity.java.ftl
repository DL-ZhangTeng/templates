package ${packageName}.activity;

import android.os.Handler;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ListView;
import android.widget.TextView;
import com.scwang.smartrefresh.layout.SmartRefreshLayout;
import com.scwang.smartrefresh.layout.api.RefreshLayout;
import com.scwang.smartrefresh.layout.listener.OnRefreshLoadmoreListener;
import java.util.ArrayList;
import java.util.List;
import ${packageName}.common.entity.${entityName};
import ${packageName}.base.BaseActivity;
import ${packageName}.R;
<#if isNoDataView>
import ${packageName}.widget.NoDataView;
</#if>


/**
 * desc fast listactivity
 */
public class ${activityClass} extends BaseActivity implements OnRefreshLoadmoreListener{
    private ListView lvTodayWorkList;
    private SmartRefreshLayout srlTodayWorkList;
	<#if isNoDataView>
    private NoDataView noDataView;
	</#if>
	private ListAdapter adapter;
    private ArrayList<${entityName}> entitys;
	private Handler handler = new Handler();

    @Override
    protected int getResourceId() {
        return R.layout.${activityLayoutName};
    }

    @Override
    protected void initView() {
        lvTodayWorkList = (ListView) findViewById(R.id.lv_list);
        srlTodayWorkList = (SmartRefreshLayout) findViewById(R.id.srl_list);
        srlTodayWorkList.setOnRefreshListener(this);
		<#if isNoDataView>
		noDataView = (NoDataView) findViewById(R.id.nodata);
		</#if>
    }

    @Override
    protected void initData() {
        adapter = new ListAdapter();
        lvTodayWorkList.setAdapter(adapter);
    }

    @Override
    public void goBack() {
        super.goBack();
        finish();
    }

    private void onLoad() {
        srlTodayWorkList.finishRefresh();
        srlTodayWorkList.finishLoadmore();
    }

    @Override
    public void onLoadmore(RefreshLayout srlTodayWorkList) {
        handler.postDelayed(new Runnable() {
            @Override
            public void run() {
                adapter.notifyDataSetChanged();
                onLoad();
            }
        }, 2000);
    }

    @Override
    public void onRefresh(RefreshLayout srlTodayWorkList) {
        handler.postDelayed(new Runnable() {
            @Override
            public void run() {
                lvTodayWorkList.setAdapter(adapter);
                onLoad();
            }
        }, 2000);
    }
//    public void requestData(final boolean isLoadMore) {
//        Api.getInstance().get**(**, **, new ResponseRetrofitCallBack(this.getContext(), true) {
//            @Override
//            public void onSuccess(String json) {
//                List<${entityName}> list = GsonHelper.getObjectListFromStr(json, ${entityName}.class);
//                if (entitys == null) {
//                    entitys = new ArrayList<>();
//                }
//                if (isLoadMore) {
//                    entitys.addAll(list);
//                } else {
//                    entitys.clear();
//                    entitys.addAll(list);
//                }
//                adapter.setList(entitys);
//                if (srlTodayWorkList.isRefreshing()) {
//                    srlTodayWorkList.finishRefresh();
//                }
//                if (srlTodayWorkList.isLoading()) {
//                    srlTodayWorkList.finishLoadmore();
//                }
//                if (adapter.isEmpty()) {
					<#if isNoDataView>
//                    noDataView.setVisibility(View.VISIBLE);
					</#if>
//                    srlTodayWorkList.setVisibility(View.GONE);
//                } else {
					<#if isNoDataView>
//                    noDataView.setVisibility(View.GONE);
					</#if>
//                    srlTodayWorkList.setVisibility(View.VISIBLE);
//                }
//            }
//
//            @Override
//            public void onFailure(String code, String message) {
//                switch (Integer.valueOf(code)) {
//                    case NetConfig.ResponseCodeConfig.NO_DATA:
//                    case NetConfig.ResponseCodeConfig.NOT_DATAUPDATE:
//                    case NetConfig.ResponseCodeConfig.FAILED_DATAUPDATE:
//                        if (!isLoadMore) {
//                            if (entitys == null) {
//                                entitys = new ArrayList<>();
//                            }
//                            entitys.clear();
//                            adapter.setList(entitys);
//                        }
//                        showToast(getResources().getString(R.string.response_onfailure_message));
//                        super.onFailure(code);
//                        break;
//                    default:
//                        super.onFailure(code, message);
//                        break;
//                }
//                if (srlTodayWorkList.isRefreshing()) {
//                    srlTodayWorkList.finishRefresh();
//                }
//                if (srlTodayWorkList.isLoading()) {
//                    srlTodayWorkList.finishLoadmore();
//                }
//                if (adapter.isEmpty()) {
					<#if isNoDataView>
//                    noDataView.setVisibility(View.VISIBLE);
					</#if>
//                    srlTodayWorkList.setVisibility(View.GONE);
//                } else {
					<#if isNoDataView>
//                    noDataView.setVisibility(View.GONE);
					</#if>
//                    srlTodayWorkList.setVisibility(View.VISIBLE);
//                }
//            }
//        });
//    }
    private class ListAdapter extends BaseAdapter {
		private List<${entityName}> entitys;

		public ListAdapter() {
			entitys = new ArrayList<>();
		}

		public ListAdapter(List<${entityName}> entitys) {
			this.entitys = entitys;
		}
        @Override
        public int getCount() {
            return entitys.isEmpty() ? 10 : entitys.size();
        }

        @Override
        public Object getItem(int position) {
            return position;
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public int getItemViewType(int position) {
            switch (position % 2) {
                case 0:
                    return 0;
                case 1:
                    return 1;
                default:
                    return 0;
            }
        }

        @Override
        public int getViewTypeCount() {
            return 2;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            int type = getItemViewType(position);
            ViewHolder viewHolder;
			if(type == 0 || type == 1){
				if (convertView == null) {
					//convertView = LayoutInflater.from(parent.getContext()).inflate(R.layout.**, null, false);
					convertView = new TextView(parent.getContext());
					viewHolder = new ViewHolder(convertView);
					convertView.setTag(viewHolder);
				} else {
					viewHolder = (ViewHolder) convertView.getTag();
				}
			}

            return convertView;
        }
		public void setEntities(List<${entityName}> entitys) {
			this.entitys = entitys;
			notifyDataSetChanged();
		}
		
        class ViewHolder {
		
            public ViewHolder(View view) {
           
			}
        }
    }
}
