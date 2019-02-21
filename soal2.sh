#!/bin/bash

awk '
{
	split($0, arr, ",")
	if (arr[7] == 2012) {
		quantity[arr[1]] = (quantity[arr[1]] + arr[10])
	}
	if (arr[7] == 2012 && arr[1] == "United States") {
		productline[arr[4]] = (productline[arr[4]] + arr[10])
	}
	if (arr[7] == 2012 && arr[1] == "United States" && arr[4] == "Personal Accessories") {
		product1[arr[6]] = (product1[arr[6]] + arr[10])
	}
	if (arr[7] == 2012 && arr[1] == "United States" && arr[4] == "Camping Equipment") {
		product2[arr[6]] = (product2[arr[6]] + arr[10])
	}
	if (arr[7] == 2012 && arr[1] == "United States" && arr[4] == "Outdoor Protection") {
		product3[arr[6]] = (product3[arr[6]] + arr[10])
	}
}
END {
	maxq=0
	for (i in quantity) {
		if (quantity[i] > maxq) {
			maxq = quantity[i]
			negara = i
		}
	}
	print negara, "dengan total penjualan sebesar", maxq
	asort(quantity)
	for (i in quantity) print i, quantity[i]
	print ""
	maxp1=0
	maxp2=0
	maxp3=0
	p1="a"
	p2="a"
	p3="a"
	for (i in productline) {
		if (productline[i] > maxp1) {
			maxp3 = maxp2
			maxp2 = maxp1
			maxp1 = productline[i]
			p3 = p2
			p2 = p1
			p1 = i
		}
		else if (productline[i] > maxp2) {
			maxp3 = maxp2
			maxp2 = productline[i]
			p3 = p2
			p2 = i
		}
		else if (productline[i] > maxp3) {
			maxp3 = productline[i]
			p3 = i
		}
	}
	print "1.", p1, "dengan total penjualan sebesar", maxp1
	print "2.", p2, "dengan total penjualan sebesar", maxp2
	print "3.", p3, "dengan total penjualan sebesar", maxp3
	print ""
	prod1="a"
	prod2="a"
	prod3="a"
	maxprod1=0
	maxprod2=0
	maxprod3=0
	for (i in product1) {
		if (product1[i] > maxprod1) {
			maxprod1 = product1[i]
			prod1 = i
		}
	}
	for (i in product2) {
		if (product2[i] > maxprod2) {
			maxprod2 = product2[i]
			prod2 = i
		}
	}
	for (i in product3) {
		if (product3[i] > maxprod3) {
			maxprod3 = product3[i]
			prod3 = i
		}
	}
	print "Personal Accessories:", prod1, "dengan total penjualan sebesar", maxprod1
	print "Camping Equipment:", prod2, "dengan total penjualan sebesar", maxprod2
	print "Outdoor Protection:", prod3, "dengan total penjualan sebesar", maxprod3
}
' WA_Sales_Products_2012-14.csv
