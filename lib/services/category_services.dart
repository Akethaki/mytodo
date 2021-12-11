
import 'package:todo_my/model/category.dart';
import 'package:todo_my/repositories/repository.dart';

class CategoryServices{
  
  late Repository _repository;

  CategoryServices(){
    _repository = Repository();
  }

  saveCategory(Category category) async {
    return await _repository.insertData('categories', category.categoryMap());
  }
}