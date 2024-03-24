part of 'page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (_, state) => (state is ProfileSuccess)
          ? Column(
              children: [
                Image.asset('assets/profile.png'),
                const SizedBox(height: 24),
                CardWidget(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dibuat ',
                        style: blackTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        state.user.createdAt.toString(),
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                TextfieldWidget(
                  label: 'Nama',
                  obsecureText: false,
                  controller: nameController,
                ),
                const SizedBox(height: 14),
                TextfieldWidget(
                  label: 'Username',
                  obsecureText: false,
                  controller: usernameController,
                ),
                const SizedBox(height: 14),
                TextfieldWidget(
                  label: 'Email',
                  obsecureText: false,
                  controller: emailController,
                ),
                const SizedBox(height: 24),
                ButtonWidget(
                  onPressed: () {},
                  isLoading: false,
                  text: 'Edit',
                  height: 40,
                  backgroundColor: kKiwiGreenColor,
                ),
                const SizedBox(height: 14),
                ButtonWidget(
                  onPressed: () async {
                    if (await confirm(
                      context,
                      title: const Text('Konfirmasi'),
                      content:
                          const Text('Apakah Anda ingin keluar dari akun?'),
                      textOK: const Text('Ya'),
                      textCancel: const Text('Tidak'),
                    )) {
                      await context.read<LogoutSubmitCubit>().Fetch();
                      LogoutSubmitState state =
                          context.read<LogoutSubmitCubit>().state;

                      if (state is LogoutSubmitSuccess) {
                        Get.off(const LoginPage());
                      } else if (state is LogoutSubmitFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                            backgroundColor: kRedColor,
                          ),
                        );
                      }
                    } else {
                      print('pressedCancel');
                    }
                  },
                  isLoading: false,
                  text: 'Logout',
                  height: 40,
                ),
              ],
            )
          : const ProfileShimmer(),
    );
  }
}
