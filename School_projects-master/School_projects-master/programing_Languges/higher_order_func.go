//victor Ipinmoroti
//Emily Ferline
package main

import "fmt"


func foo(v int) bool {// ananomus function aka foo takes in the element
	if v%2 == 0 {//use mod to decide if element is even
	   return true// if even reurn true
	} else{
	   return false
	} 
 }
 func even_Filter(l []int, f func(v int) bool) []int{//even filter takes in slice or array of int and an ananomus function that takes in integer and return bool 
	li := make([] int, 0)//make a new slice or array
	for _, v := range l {//for loop that that goes from beging of arg slice index to the end
		if f(v) {//anamous function is used to decide if element is even or not
			li = append(li, v)//if foo comes back true add element to new list
		}
	}
	return li//return new list
 }
 func odd_Filter(l []int, f func(v int) bool) []int {//does the same thing even filter does but in reverse(get the odd number instead)
	li := make([] int, 0)
	for _, v := range l {
		if !f(v) {
			li = append(li, v)
		}
	}
	return li
 }
 func initlist(nelement int) []int{
	fmt.Println("********************************************************************")//indicate start of function
	fmt.Println("Begin Entering")//ask user to start entering
	array:=make([]int,nelement)//make a slice that has the cpacity specified by user
	for i:=0; i<nelement; i++{//for loop to intalize slice
	   fmt.Println("------------")//indicate new value to be entered
	   fmt.Scanln(&array[i])//get  user input
	} 
	return array
}

func Maper(n int, f func(int) []int) []int {
	
	return f(n)
 }
 func max(element []int) int{// function to get max value
	var q =element[0]
	for  i:=0; i<len(element); i++{
		if element[i]>q{
			q=element[i]
		}
	}
   return q

 }
 func min(element []int) int{// function    to get  min value
	var q =element[0]
	for  i:=0; i<len(element); i++{
		if element[i]<q{
			q=element[i]
		}
	}
   return q

 }
 func add(element []int) int{// function to add all element
	var q int
	for  i:=0; i<len(element); i++{
	   q=q+element[i]
   }
   return q
 }
 func reduce(h []int,f func(l []int) int) int{// the function simply adds,or get max all the elemnets in filter list and return an answer
	 var j int
	 j=f(h)
	return j
 }
func main(){
	var nelement1 int
	var first string
	var second string
	var ans int
	fmt.Println("Please enter the amount of integers you would like to put in a list")
	fmt.Scanln(&nelement1)
	List:=Maper(nelement1,initlist)
	fmt.Println("Enter even or odd for the set of numbers you whish to oprate on")
	fmt.Println("You can enter anything else to opperate on all the number")
	fmt.Scanln(&first)
	fmt.Println("enter the operation to perform enter max, min or anything to add")
	fmt.Scanln(&second)
	if first=="even"{
		filter_list:=even_Filter(List,foo)// declare filter list call even_filter and but the reurn list into filter_list
		if second=="max"{
			ans=reduce(filter_list,max)//we call reduce function and pass filter list into it with use user chice of operation
		}else if second=="min"{
			ans=reduce(filter_list,min)
		}else{
			ans=reduce(filter_list,add)
		}
	 }else if first=="odd"{// if user chose odd the whole process with even filter happens agian but this time odd _filter is called
		filter_list:=odd_Filter(List,foo)
		if second=="max"{
			ans=reduce(filter_list,max)
		}else if second=="min"{
			ans=reduce(filter_list,min)
		}else{
			ans=reduce(filter_list,add)
		}
	 }else{
		if second=="max"{
			ans=reduce(List,max)
		}else if second=="min"{
			ans=reduce(List,min)
		}else{
			ans=reduce(List,add)
		}
	 }
	 fmt.Println("The ans is :)")
	 fmt.Println(ans)
}