import 'package:deriv_dot_com_flutter/deriv_tracker/cubit/devir_tracker_cubit.dart';
import 'package:deriv_dot_com_flutter/deriv_tracker/view/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class DerivPage extends StatelessWidget {
  const DerivPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Price Tracker',
          style: GoogleFonts.sora(
            fontSize: 19,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocProvider<DevirTrackerCubit>(
        create: (_) => DevirTrackerCubit()..listenForActiveSymbols(),
        child: DerivPageContent(),
      ),
    );
  }
}

class DerivPageContent extends StatelessWidget {
  const DerivPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<DevirTrackerCubit, DevirTrackerState>(
        builder: (context, state) {
          return state.status == DevirTrackerStateStatus.success
              ? ListView(
                  children: [
                    DerivTextFiled(),
                    const Gap(10),
                    SymbolListView(state: state),
                    const Gap(30),
                    Text(
                      'AUD/USD',//state.selectedSymbol?.displayName ?? '#/#',
                      style: GoogleFonts.sora(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const Gap(10),
                    Container(
                      height: 40,
                      child: Text(
                        '609.10',
                        // number: '${tick.quote}',
                        // parseNumber: (source) => double.parse(source),
                        // increaseColor: Colors.red,
                        // decreaseColor: Colors.green,
                        style: GoogleFonts.sora(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            text: 'Ask: ',
                            children: [
                              TextSpan(
                                text: 'ask', //'${tick.ask}',
                                style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          style: GoogleFonts.sora(),
                        ),
                        const Gap(70),
                        Text.rich(
                          TextSpan(
                            text: 'Bid: ',
                            children: [
                              TextSpan(
                                text: 'bid', //'${tick.bid}',
                                style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          style: GoogleFonts.sora(),
                        ),
                      ],
                    ),
                    const Gap(30),

                    TrackerChart(state)
                  ],
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class DerivTextFiled extends StatelessWidget {
  const DerivTextFiled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.sora(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8.0),
        prefixIcon: Icon(Icons.search),
        hintText: "search",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}

class SymbolListView extends StatelessWidget {
  const SymbolListView({required this.state, Key? key}) : super(key: key);
  final DevirTrackerState state;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          ...state.activeSymbols
              .map(
                (e) => Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      e.displayName,
                      style: GoogleFonts.sora(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
