import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16)
      ),
      margin: EdgeInsets.only(left: 16,right: 16,top: 16),
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/Book Club.png',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('This is a Birthday Party ',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),),
                    Icon(Icons.favorite_border)
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16,left: 16),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white
            ),
            child: Column(
              children: [
                Text('22',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).primaryColor,

                ),),
                Text('Now',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).primaryColor,), )
              ],
            ),
          )
        ],
      ),
    );
  }
}
