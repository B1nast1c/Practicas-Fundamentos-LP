#include <iostream>
#include <vector>
using namespace std;

vector<int> Partition(vector<int> &v1, int ini,  int fin){
  int pivot=v1[ini]; //Pivote, primer elemento 
  int current=ini+1; //Elemento primero a comparar
  int lessPivot=ini; //Menor al pivote
  int GreaterPivot=fin; //Mayor al pivote

  //Existen 3 divisiones en cada particion, menor, igual y mayor al pivote

  while (current <= GreaterPivot){
  /*Mientras la pos actual es menor al indice
  donde empiezan los elementos mayores al pivote */
    if (v1[current] < pivot){ //Menor
      swap(v1[lessPivot], v1[current]);
      current++;
      lessPivot++;
    }
    else if (v1[current] > pivot){ //Mayor
      swap(v1[current], v1[GreaterPivot]);
      GreaterPivot--;
    }
    else{ //Igual, next element
      current++;
    }
  }
  return {lessPivot, GreaterPivot};
}

void QuickSort(vector<int> &v1, int ini, int fin){ /*QuickSort clásico*/
  if (ini < fin){
    vector<int> SubArray=Partition(v1, ini, fin);
    int Left=SubArray.front();
    int Right=SubArray.back();
    QuickSort(v1, ini, Left-1); //Recursividad
    QuickSort(v1, Right+1, fin);
  }
}

int main(){
  vector<int> v1={1,2,5,3,3,4,6,4,9,2}; //Caso ejemplo
  QuickSort(v1, 0, v1.size()-1);
  cout<<"{";
  for(auto x:v1){
    cout<<" "<<x;
  }
  cout<<" }";
}
