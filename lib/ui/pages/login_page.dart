part of 'page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void submit() async {
    setState(() {
      isLoading = true;
    });

    await context.read<LoginCubit>().Fetch(
          usernameController.text,
          passwordController.text,
        );
    LoginState state = context.read<LoginCubit>().state;

    setState(() {
      isLoading = false;
    });

    if (state is LoginSuccess) {
      print(await getAuthorizationSession());
      Get.off(const MainPage());
    } else if (state is LoginFailed) {
      if (state.exception['status']) {
        errorModalBottom(
          context: context,
          exception: state.exception,
        );
      } else {
        var message = state.message;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: kRedColor,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultEdgeInsets,
        ),
        children: [
          const SizedBox(
            height: 42,
          ),
          Text(
            'v.1.0.0',
            style: greyTextStyle.copyWith(
              fontSize: 12,
              color: kGreyColor,
              fontWeight: medium,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
              ),
              Container(
                height: 46,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/logo.png',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              CardWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextfieldWidget(
                      label: 'Username',
                      obsecureText: false,
                      controller: usernameController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextfieldWidget(
                      label: 'Password',
                      obsecureText: true,
                      controller: passwordController,
                      onSubmitted: (text) async {
                        submit();
                      },
                    ),
                    const SizedBox(height: 16),
                    ButtonWidget(
                      text: 'Masuk',
                      height: 40,
                      onPressed: (!isLoading)
                          ? () {
                              submit();
                            }
                          : null,
                      isLoading: isLoading,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
