///////////////////////////////////////////////////////////////////////////

   - TSP100LAN Telnet Script -
        Readme �t�@�C��                                      2016/06/21

    Copyright (C) 2016 Star Micronics Co., Ltd. All rights reserved.
///////////////////////////////////////////////////////////////////////////

�X�N���v�g���g�p���邱�ƂŁATSP100LAN��#9100�|�[�g�̐ݒ��e�ՂɕύX����
���Ƃ��o���܂��B
�ȉ��X�N���v�g�̎g�p���@�ɂ��Đ������܂��B


=========
1. �Ή�OS
=========

�{�X�N���v�g�́A�ȉ���OS���T�|�[�g���Ă���܂��B

  �EWindows
      Windows 7   (32bit/64bit)
      Windows 8   (32bit/64bit)
      Windows 8.1 (32bit/64bit)
      Windows 10  (32bit/64bit)

  �ELinux
      Red Hat Enterprise Linux 6.7
      openSUSE 13.1
      Fedora 20
      ubuntu 16.04 LTS
      CentOS 6.8

  �EMac
      Mac OS X 10.6
      Mac OS X 10.7
      Mac OS X 10.8
      Mac OS X 10.9
      Mac OS X 10.10
      Mac OS X 10.11


==========
2. Windows
==========

2-1. Telnet�R�}���h���g�p���邽�߁A���O�Ɉȉ��̓��e�����m�F���ĉ������B

  �EWindows7
      1). �X�^�[�g���j���[����A�u�ݒ�v���u�R���g���[���p�l���v��I�����܂��B
      2).�u�v���O�����Ƌ@�\�v��I�����܂��B
      3). �^�X�N�ꗗ���A"Windows�̋@�\�̗L�����܂��͖�����"��I�����܂��B
      4). ���[�U�A�J�E���g�����ʂł́u���s�v��I�����܂��B
      5).�uTelnet�N���C�A���g�v�̃`�F�b�N�����Ă��Ȃ��ꍇ�́A�`�F�b�N��t����
         �uOK�v���������܂��B

  �EWindows8/8.1
      1).�u�f�X�N�g�b�v�v��ʂŁu�`���[���o�[�v���u�ݒ�v���u�R���g���[���p�l���v
          ��I�����܂��B
      2).�u�v���O�����v��I�����܂��B
      3).�u�v���O�����Ƌ@�\�v���A"Windows�̋@�\�̗L�����܂��͖�����"��I�����܂��B
      4). ���[�U�A�J�E���g�����ʂł́u���s�v��I�����܂��B
      5).�uTelnet�N���C�A���g�v�̃`�F�b�N�����Ă��Ȃ��ꍇ�́A�`�F�b�N��t����
         �uOK�v���������܂��B

  �EWindows10
      1). �X�^�[�g���j���[����A�u���ׂẴA�v���v���uWindows�V�X�e���c�[���v��
          �u�R���g���[���p�l���v��I�����܂��B
      2).�u�v���O�����v��I�����܂��B
      3).�u�v���O�����Ƌ@�\�v���A"Windows�̋@�\�̗L�����܂��͖�����"��I�����܂��B
      4). ���[�U�A�J�E���g�����ʂł́u���s�v��I�����܂��B
      5).�uTelnet�N���C�A���g�v�̃`�F�b�N�����Ă��Ȃ��ꍇ�́A�`�F�b�N��t����
         �uOK�v���������܂��B


2-2. IP�A�h���X�ƃp�X���[�h�̐ݒ�

    bat�t�@�C������ IP�A�h���X�A�p�X���[�h��K�؂Ȓl�ɕύX���ĉ������B
    �f�t�H���g�l�́A�ȉ��̒ʂ�B
        IP�A�h���X: "192.168.123.45"
        �p�X���[�h: "public"

      1). #9100�}���`�Z�b�V�����𖳌��ɂ���
            "Execute_9100Single.bat" ��ύX�B

      2). #9100�}���`�Z�b�V������L���ɂ���
            "Execute_9100Multi.bat"  ��ύX�B

    ���p�X���[�h�̍H��o�׎��̒l�́A"public"�ł��B


2-3. bat�t�@�C���̎��s

    bat�t�@�C�����_�u���N���b�N���Ď��s���ĉ������B

      1). #9100�}���`�Z�b�V�����𖳌��ɂ���
            "Execute_9100Single.bat" �����s�B

      2). #9100�}���`�Z�b�V������L���ɂ���
            "Execute_9100Multi.bat"  �����s�B


==============
3. Linux / Mac
==============

3-1. Linux���ł̓X�N���v�g�̎��s�̂��߁A�ȉ��̃p�b�P�[�W���C���X�g�[��
     ����K�v������܂��B

  �E�K�v�ȃp�b�P�[�W
      - expect
      - telnet

  �E�C���X�g�[�����@
      �^�[�~�i��(�R���\�[��)���N�����܂��B
      �ȉ��̃R�}���h���A�Ǘ��Ҍ����Ŏ��s���ĉ������B
      ���R�}���h�̎��s�́A�C���^�[�l�b�g�ɐڑ�����Ă���K�v������܂��B

      - Red Hat Enterprise Linux6.7/CentOS6.8
          # yum install expect
          # yum install telnet

      - Fedora20
          # yum install expect

      - openSUSE13.1
          # zypper in expect

      - ubuntu16.04 LTS
          $ suto apt-get install expect


3-2. �X�N���v�g�̎��s

    �^�[�~�i��(�R���\�[��)���N�����܂��B
     ��������IP�A�h���X��ݒ肵�A�������Ƀp�X���[�h��ݒ肵�āA�X�N���v�g
    �����s���ĉ������B

      1). #9100�}���`�Z�b�V�����𖳌��ɂ���

         ��)
          /bin/bash 9100Single.sh "192.168.123.45" "public"

      2). #9100�}���`�Z�b�V������L���ɂ���

         ��)
          /bin/bash 9100Multi.sh "192.168.123.45" "public"

    ���p�X���[�h�̍H��o�׎��̒l�́A"public"�ł��B

