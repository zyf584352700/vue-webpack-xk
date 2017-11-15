<template>
  <div class="ClassInfo">
    <el-row class="header">
  		<el-col :span='6'>
  			<el-input v-model="keywords" placeholder="请输入关键字" @change="toSearch"></el-input>
  		</el-col>
  		<el-col :span='18' class="saveOptions">
        <el-button plain @click="handleSingleSave">单个录入</el-button>
        <el-button plain>批量导入</el-button>
      </el-col>
  	</el-row>
    <el-row>
      <el-col>
        <el-table
          :data="classes"
          style="width: 100%">
          <el-table-column
            prop="name"
            label="班级名">
          </el-table-column>
          <el-table-column label="操作" width="180">
            <template slot-scope="scope">
              <el-button
                size="mini"
                @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
              <el-button
                size="mini"
                type="danger"
                @click="handleDelete(scope.$index, scope.row)">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-col>
    </el-row>

    <el-dialog :title="title" :visible.sync="dialogFormVisible">
      <el-form :model="form">
        <el-form-item label="班级名">
          <el-input v-model="form.name"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="handleSubmit">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {mapGetters,mapActions} from 'vuex'
export default {
  name: 'ClassInfo',
  data () {
    return {
      keywords: '',
      form:'',
      dialogFormVisible:false,
      title:'',
    }
  },
  created:function(){
    this.findAllClass();
  },
  computed:{
    ...mapGetters(['classes']),
  },
  methods:{
    //搜索
    toSearch:function(){
      var vm = this;
      this.toSearch(this.keywords);
    },
    //录入信息
    handleSingleSave:function(){
      this.form = {};
      this.title = '录入班级信息';
      this.dialogFormVisible = true;
    },
    //修改信息
    handleEdit:function(index,row){
      this.form = row;
      this.title = '修改班级信息';
      this.dialogFormVisible = true;
    },
    //确认保存和修改
    handleSubmit:function(){
      var vm = this;
      if(this.title == '录入班级信息'){
        this.saveClass(this.form).then(function(result){
          vm.$message({
            message: '恭喜你，操作成功了',
            type: 'success'
          });
        }).catch(function(error){
          vm.$message.error('真抱歉，操作失败了');
        });
      } else {
        this.updateClass(this.form).then(function(result){
          vm.$message({
            message: '恭喜你，操作成功了',
            type: 'success'
          });
        }).catch(function(error){
          vm.$message.error('真抱歉，操作失败了');
        });
      }
      this.dialogFormVisible = false;
    },
    //删除
    handleDelete:function(index,row){
      var vm = this;
      this.batchDeleteClass(row.id).then(function(result){
        vm.$message({
          message: '恭喜你，操作成功了',
          type: 'success'
        });
      }).catch(function(error){
        vm.$message.error('真抱歉，操作失败了');
      });
    },
    ...mapActions(['findAllClass','toSearch','batchDeleteClass','saveClass','updateClass']),
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .saveOptions{
    text-align: right;
  }
  .StudentInfo .header {
    margin: 5px 0;
  }
</style>
