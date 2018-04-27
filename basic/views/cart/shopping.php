<?php

/* @var $this yii\web\View
 * @1013753944@qq.com
 */
use yii\helpers\Html;
$this->title();
?>
<div class="w960" id="cart">
    <div id="LoginFalse" class="login_tip"><span class="icon"></span>您还没有登录！登录后购物车的商品将保存到您的帐号中<a href="javascript:cart.cartLogin()" class="btn">立即登录</a></div>
    <ul class="shopping_title" id="j_carttitle">
        <li class="f1"><a id="j_selectall" href="javascript:void(0)" class="checknow fn-checkall check_on" dd_name="全选">选中</a>全选</li>
        <li class="f2">商品信息</li>
        <li class="f3">单价（元）</li>
        <li class="f4">数量</li>
        <li class="f4">金额（元）</li>
        <li class="f5">操作</li>
    </ul>
    <div class="fn-shops" id="J_cartContent">
        <div class="fn-shop">
            <table border="0" cellspacing="0" cellpadding="0" class="shop_title">
                <tbody>
                <tr>
                    <td>
                        <a href="javascript:void(0)" dd_name="选中店铺" class="checknow fn-shop-checkall check_on">选中</a>
                    </td>
                    <td>

                    </td>
                    <td>
                        <a href="/" target="_blank">小巧玲珑书吧自营</a>
                    </td>
                    <td class="coupon_title_td hide">
                        <div class="coupon_choose" id="coupon_title_0">
                            <a class="coupon_choose_pointer">优惠券</a>
                        </div>
                        <div id="coupon_pop_container" style="position: relative;z-index:99;"></div>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                </tbody>
            </table>

<div class="shopping_list"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tbody data-stock="102" data-offline="false" data-productid="25254513" data-timestamp="1524726095000" data-orderforspupormo="0"><tr id="tr_623477632" class="bb_none">
            <td class="row1"> <a href="javascript:void(0)" data-item="623477632" class="fn-product-check checknow check_on">选中</a> </td>
            <td class="row_img">
                <a href="http://product.dangdang.com/25254513.html" target="_blank" dd_name="查看详情">
                    <img onmouseout="$(this).parent().next().hide()" onmouseover="$(this).parent().next().show()" src="http://img3x3.ddimg.cn/9/15/25254513-1_m_5.jpg" width="80" height="80"> </a> <div style="display: none;" class="img_big">
                    <a href="http://product.dangdang.com/25254513.html" dd_name="查看详情" target="_blank">
                        <img src="http://img3x3.ddimg.cn/9/15/25254513-1_b_5.jpg"></a><span class="arrow"></span></div> </td> <td class="row_name">
                <div class="name">
                    <a href="http://product.dangdang.com/25254513.html" title="别让好脾气害了你（不再过度善良，告别“老好人”；告诉你不迎合、不妥协，也能拥有人生主动权的奥秘）" target="_blank" dd_name="查看详情" style="word-break:break-all;  word-wrap:break-word;">别让好脾气害了你（不再过度善良，告别“老好人”；告诉你不迎合、不妥协，也能拥有人生主动权的奥秘）
                    </a>
                </div>
                <div class="price_down red">比加入购物车时降低3.30元</div>
            </td>
            <td class="row3"><span>¥24.20</span><div class="low_price fn-up" style="display:none;">优惠价格<em></em><div class="low_pop" style="display:none">
                        <ul>
                            <li>· 比上一次进入购物车价格下降3.3元</li>
                        </ul>
                    </div>
                </div>
            </td>
            <td data-minbuy="0" class="fn-count-tip row3 "><span class="amount fn-updatecount " data-value="5">
                    <a dd_name="减少数量" href="javascript:void(0)">-</a>
                    <input data-value="5" value="5" type="text">
                    <a dd_name="增加数量" href="javascript:void(0)">+</a>
                </span>
            </td>
            <td class="row4"><span class="red">¥121.00</span></td> <td class="row5 ">
                <span><a href="javascript:void(0)" data-cartitemid="623477632" data-productid="25254513" data-mainproductid="0" data-productname="别让好脾气害了你（不再过度善良，告别“老好人”；告诉你不迎合、不妥协，也能拥有人生主动权的奥秘）" data-saleprice="24.2" data-categorypath="01.21.01.01.00.00" data-item-detail="{&quot;cartItemId&quot;:623477632,&quot;productId&quot;:25254513}" class="fn-add-wish" dd_name="加入收藏按钮">移入收藏</a></span><span><a href="javascript:void(0)" data-item="623477632" class="fn-remove-product" dd_name="删除普通品">删除</a>
                </span>
            </td>
        </tr>
        </tbody>
        <tfoot>
        <tr class="total"> <td class="row1">&nbsp;</td>
            <td class="row_img">店铺合计</td> <td colspan="2">&nbsp;</td>
            <td colspan="3" class="row4">
                <span class="red big ooline alignright">¥121.00</span>
                <span class="shipping_tip">满49元包邮 <a href="javascript:;" class="more" data-categoryid="2" data-pids="25254513" data-stockids="null" data-topprice="NaN" data-pricediff="10.60" data-totalprice="48.40">免运费凑单</a>
                </span>
            </td>
        </tr>
        </tfoot>
    </table>
</div>

            <!--结算-->
<div style="position: static; bottom: -20px; z-index: 101; width: 100%; left: 0px;">
    <div class="shopping_total" id="J_totalMoneyBlock">
        <div class="shopping_total_right">
            <a class="total_btn fn-checkout" href="javascript:;" id="checkout_btn" dd_name="结算">结&nbsp;&nbsp;算</a>
            <div class="subtotal">
                <p><span class="cartsum">总计(不含运费)：</span><span id="payAmount" class="price">¥121.00</span></p>

                <p><span class="cartsum">已节省：</span><span id="totalFavor">¥0.00</span></p>
            </div>
            <div class="pop_del pop_ebook fn-ck" id="ck_tip" style="display:none">
                <h1>电子书重复购买提示</h1>
                <p></p>
                <a id="ck_link" href="#" class="pop_btn">朕知道了</a>
            </div>
        </div>
        <div class="shopping_total_left" id="J_leftBar">
            <a id="j_selectall2" href="javascript:void(0)" class="checknow fn-checkall check_on" dd_name="全选">选中</a>全选
            <a id="j_removeproducts" href="javascript:void(0)" class="fn-batch-remove" dd_name="批量删除按钮">批量删除</a>
            <span>已选择<font color="red">5</font>件商品</span>
            <div id="J_batchRemoveProductBox" style="display: none;z-index:-1;left:0px;" class="pop_del"><p>您确定要批量删除商品吗？</p><a href="javascript:;" class="pop_btn fn-confirm-batchremovebox">确定</a><a href="javascript:;" class="pop_btn fn-close-batchremovebox">取消</a></div>
            <div id="J_batchAddWishBox" style="display: none;z-index:-1;left:85px;" class="pop_del col "><p>您确定要批量移入收藏吗？</p><a href="javascript:;" class="pop_btn fn-confirm-batchaddwish">确定</a><a href="javascript:;" class="pop_btn fn-close-batchwishbox">取消</a></div>
        </div>
    </div>
</div>