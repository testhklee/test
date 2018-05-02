<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">메인</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-comments fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">26</div>
                        <div>새 신청</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-green">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-tasks fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">12</div>
                        <div>회원 문의</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-yellow">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-shopping-cart fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">${todayVisitor }</div>
                        <div>오늘 접속자 수</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6">
        <div class="panel panel-red">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-3">
                        <i class="fa fa-support fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">13</div>
                        <div>오늘 매출</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-8">
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-bar-chart-o fa-fw"></i> 최근 한달 방문자 수
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div id="morris-bar-chart"></div>
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-8 -->
    <div class="col-lg-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-bell fa-fw"></i> Today's Notifications
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body mainNotice">
                <div class="list-group">
                    <a href="#" class="list-group-item">
                        <i class="fa fa-comment fa-fw"></i> 방문자
                        <span class="pull-right text-muted small"><em>100</em>
                        </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-twitter fa-fw"></i> 가입자
                        <span class="pull-right text-muted small"><em>2</em>
                        </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-money fa-fw"></i> 매출
                        <span class="pull-right text-muted small"><em>4</em>
                        </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-bolt fa-fw"></i> 결제
                        <span class="pull-right text-muted small"><em>10</em>
                        </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-warning fa-fw"></i> 환불
                        <span class="pull-right text-muted small"><em>2</em>
                        </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-tasks fa-fw"></i> 티쳐 신청
                        <span class="pull-right text-muted small"><em>3</em>
                        </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-upload fa-fw"></i> 비지니스 신청
                        <span class="pull-right text-muted small"><em>2</em>
                        </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-shopping-cart fa-fw"></i> 1:1 문의
                        <span class="pull-right text-muted small"><em>5</em>
                        </span>
                    </a>
                </div>
                <!-- /.list-group -->
            </div>
            <!-- /.panel-body -->
        </div>
    </div>
    <!-- /.col-lg-4 -->
</div>
<!-- /.row -->

<!-- Morris Charts JavaScript -->
<script src="resources/admin/vendor/raphael/raphael.min.js"></script>
<script src="resources/admin/vendor/morrisjs/morris.min.js"></script>
<script type="text/javascript">
$(function(){
    Morris.Bar({
        element: 'morris-bar-chart',
        data: [{
            x: '2006',
            y: 100,
        },{
            x: '2007',
            y: 110,
        },{
            x: '2008',
            y: 100,
        },{
            x: '2009',
            y: 120,
        },{
            x: '2010',
            y: 130,
        },{
            x: '2011',
            y: 200,
        },{
            x: '2012',
            y: 100,
        }],
        xkey: 'x',
        ykeys: 'y',
        labels: '방문자',
        hideHover: 'auto',
        resize: false
    });
});
</script>